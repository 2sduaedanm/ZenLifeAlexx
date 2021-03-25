import json
import mimetypes
from datetime import datetime
import boto3 as boto3
from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.db.models import Max, F, Count, Aggregate
from django.utils import timezone
from rest_framework import generics, status, permissions
from rest_framework.decorators import action, api_view, authentication_classes, permission_classes
from rest_framework.parsers import FileUploadParser, MultiPartParser
from rest_framework.response import Response
from structaq import models
from structaq.utils import clean_filename
from . import serializers
from . import utils


# Create your views here.
class S3Service(generics.RetrieveUpdateAPIView):

    @staticmethod
    def get_s3_client():
        return boto3.Session().client('s3')

    @staticmethod
    def get_object_key(**kwargs):
        return '{0}/{1}/{2}/{3}/{4}/{5}'.format(
            settings.VIDEO_FOLDER,
            kwargs.get('pid'),
            kwargs.get('sid'),
            kwargs.get('cid'),
            kwargs.get('chid'),
            kwargs.get('obj')
        )

    @staticmethod
    def create_bucket(s3_client):

        created = False

        buckets = s3_client.list_buckets().get('Buckets', None)

        if buckets is not None and len(buckets):
            for bucket in buckets:
                bucket_name = bucket.get('Name', None)
                if bucket_name is not None and bucket_name == settings.AWS_STORAGE_BUCKET_NAME:
                    created = True

            if not created:
                s3_client.create_bucket(
                    ACL='public-read-write',
                    Bucket=settings.AWS_STORAGE_BUCKET_NAME,
                    CreateBucketConfiguration={
                        'LocationConstraint': settings.AWS_S3_REGION_NAME
                    }
                )

        return created

    @staticmethod
    def create_upload_url(s3_client, key):
        return s3_client.generate_presigned_post(
            Bucket=settings.AWS_STORAGE_BUCKET_NAME,
            Key=key
        )

    @staticmethod
    def create_url(s3_client, key):
        return s3_client.generate_presigned_url(
            'get_object',
            Params={
                'Bucket': settings.AWS_STORAGE_BUCKET_NAME,
                'Key': key
            },
            ExpiresIn=settings.S3_OBJECT_EXPIRATION
        )

    @api_view(['GET'])
    def sign_s3_upload(request, object_name, insrtuctor_id, student_id, curriculum_id, challenge_id, progression_id):
        # print(request.META)
        # print(request.user)
        cl = S3Service.get_s3_client()

        key = S3Service.get_object_key(
            pid=progression_id,
            sid=student_id,
            cid=curriculum_id,
            chid=challenge_id,
            obj=clean_filename(object_name)
        )

        bucket_created = S3Service.create_bucket(cl)

        return Response({
            'success': True,
            'message': 'Bucket created - {}'.format(bucket_created),
            'data': {
                'upload': S3Service.create_upload_url(cl, key),
                'url': S3Service.create_url(cl, key),
            }
        })


class ListFeatureProgression(generics.ListCreateAPIView):
    queryset = models.FeatureProgression.objects.all()
    serializer_class = serializers.FeatureProgressionSearchSerializer


class ListFeatureStudent(generics.ListCreateAPIView):
    serializer_class = serializers.FeatureStudentSerializer

    def get_queryset(self):
        progression_pk = self.kwargs['progression_pk']
        user_ids = [i[0] for i in
                    models.FeatureStudentProgression.objects.filter(progression=progression_pk).values_list('student_id')]
        users = models.FeatureStudent.objects.filter(id__in=user_ids)
        name_filter = self.request.GET.get('name', None)
        if name_filter:
            users = users.filter(first__icontains=name_filter)

        return users.order_by('first_name')


class FeatureStudentGeneric(generics.RetrieveUpdateAPIView):
    # parser_classes = (FileUploadParser,)
    parser_classes = (MultiPartParser, FileUploadParser,)
    serializer_class = serializers.FeatureStudentSerializer

    @api_view(['POST'])
    def update_student_photo(self, student_id):
        student_photo = self.FILES.get('file', None)

        student = models.FeatureStudent.objects.filter(
            id=int(student_id),
        ).first()

        if student is None:
            Response({'success': False, 'message': 'Something went wrong [UPDATE STUDENT PHOTO]!'})

        # student_photo = self.data.get('file', None)
        if student_photo:
            student.photo = student_photo
        else:
            return Response({'success': False, 'message': 'Something went wrong [UPDATE STUDENT PHOTO]!'})

        student.save()

        return Response({'success': True})


class ListStudentCurriculum(generics.ListCreateAPIView):
    serializer_class = serializers.FactStudentCurriculumSerializer

    @api_view(['GET'])
    def get_students_curriculum_details(self, progression_pk):
        _now = datetime.now()
        current_month = _now.month
        current_year = _now.year

        user_ids = [i[0] for i in
                    models.FeatureStudentProgression.objects.filter(
                        progression=progression_pk
                    ).values_list('student_id')]

        users = models.FactStudentCurriculum.objects.filter(id__in=user_ids)
        serializer_extended = serializers.FactStudentCurriculumSerializer(users, many=True)

        users_belt = list()

        for item in serializer_extended.data:
            student = item.get('student', None)
            if student is not None:
                student.update({'age': utils.getAge(current_month, current_year, student.get('birthdate', None))})
                curriculum = item.get('curriculum', None)
                if curriculum is not None:
                    student.update({'curriculum': curriculum})
                    student.update({'curriculum_id': curriculum.get('id', None)})
                    student.update({'curriculum_short': curriculum.get('short', None)})
                    student.update({'curriculum_name': curriculum.get('name', None)})
                    student.update({'curriculum_belt': curriculum.get('belt', None)})
                    student.update({'curriculum_img': curriculum.get('img', None)})
                    users_belt.append(student)

        return Response(users_belt)


class ListChallengeTypes(generics.ListCreateAPIView):
    queryset = models.ChallengeType.objects.all()
    serializer_class = serializers.ChallengeTypeSerializer


class FeatureProgressionGeneric(generics.RetrieveUpdateAPIView):
    serializer_class = serializers.FeatureProgressionSerializer

    def get_queryset(self):
        return models.FeatureProgression.objects.all()

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = serializers.FeatureProgressionDetailedSerializer(instance)
        return Response(serializer.data)

    @api_view(['GET'])
    def get_students_curriculum(self, progression_pk, student_pk):
        curriculum_ids = [i[0] for i in models.FactStudentCurriculum.objects.filter(
            progression_id=progression_pk,
            student_id=student_pk
        ).values_list('curriculum')]

        queryset = models.FeatureCurriculum.objects.filter(id__in=curriculum_ids)
        curriculum_filter = self.GET.get('name', None)
        if curriculum_filter:
            queryset = queryset.filter(name__icontains=curriculum_filter)

        serializer = serializers.FeatureCurriculumListSerializer(queryset.all(), many=True)

        curriculum_challenge = [dict({i[0]: i[1]}) for i in models.FeatureChallengeCurriculum.objects.filter(
            progression_id=progression_pk,
            curriculum_id__in=curriculum_ids
        ).order_by('curriculum').values_list('curriculum', 'challenge', )]

        challenge_by_id = dict()

        for item in curriculum_challenge:
            for k, v in item.items():
                challenge_by_id[k] = challenge_by_id.get(k, []) + [v]

        challenge_passed = dict()

        for k, v in challenge_by_id.items():
            queryset_ = models.FactStudentChallenge.objects.filter(
                student_id=student_pk,
                challenge_id__in=v,
                passed=True
            ).values('id', 'challenge', 'passed', )
            challenge_passed[k] = queryset_.count()

        for item in serializer.data:
            item['challenges_total'] = len(challenge_by_id.get(item.get('id'), []))
            item['challenges_passed'] = challenge_passed[item.get('id')]

        return Response(serializer.data)

    @api_view(['GET'])
    def get_students_challenge(self, student_pk, progression_pk, curriculum_pk):
        curriculum_ids = [i[0] for i in models.FactStudentCurriculum.objects.filter(
            progression_id=progression_pk,
            student_id=student_pk).values_list('curriculum')]

        if curriculum_pk not in curriculum_ids:
            return Response({'error': 'There is no student associated with this curriculum!'})

        challenge_ids = [i[0] for i in models.FeatureChallengeCurriculum.objects.filter(
            progression_id=progression_pk,
            curriculum_id=curriculum_pk
        ).values_list('challenge')]

        queryset = models.FeatureChallenge.objects.filter(id__in=challenge_ids).all().annotate(
            total=F('challengetype_id')
        )

        serializer = serializers.FeatureChallengeListSerializer(queryset, many=True)

        queryset_ = models.FactStudentChallenge.objects.filter(
            student_id=student_pk,
            challenge_id__in=challenge_ids
        ).values('id', 'student', 'challenge', 'passed', 'pass_date', 'instructed', 'instructed_date', )

        for item in serializer.data:
            item.update({'passed': None})
            item.update({'pass_date': None})
            item.update({'instructed': None})
            item.update({'instructed_date': None})
            for item_extend in queryset_:
                if item['id'] == item_extend['challenge']:
                    item.update({'passed': item_extend['passed']})
                    item.update({'pass_date': item_extend['pass_date']})
                    item.update({'instructed': item_extend['instructed']})
                    item.update({'instructed_date': item_extend['instructed_date']})

        challengetype_return_list = list()
        channenges_dict_by_type = dict()

        for item in serializer.data:
            challengetype = item.get('challengetype', None)
            if challengetype is not None:
                local_challengetype_id = challengetype.get('id', None)
                channenges_dict_by_type.update({local_challengetype_id: channenges_dict_by_type.get(local_challengetype_id, []) + [item]})
                if challengetype not in challengetype_return_list:
                    challengetype_return_list.append(challengetype)

        challengetype_list_export = list()

        for challengetype in challengetype_return_list:
            local_challengetype = challengetype.get('id', None)
            dict_challengetype = dict()
            dict_challengetype.update({'challengetype': challengetype})
            dict_challengetype.update({'challenges': channenges_dict_by_type.get(local_challengetype, None)})
            challengetype_list_export.append(dict_challengetype)

        return Response(challengetype_list_export)

    @api_view(['GET'])
    def get_students_challenge_details(self, student_pk, challenge_pk):
        queryset_extended = models.FactStudentChallenge.objects.filter(student_id=student_pk, challenge_id=challenge_pk)
        # challenge_ids = [i[0] for i in queryset_extended.values_list('challenge')]
        #
        # if challenge_pk not in challenge_ids:
        #     return Response({'error': 'There is no student associated with this challenge!'})

        serializer_extended = serializers.FactStudentChallengeSerializer(queryset_extended.first())

        queryset = models.FeatureChallenge.objects.filter(id=challenge_pk).first()
        serializer = serializers.FeatureChallengeListSerializer(queryset)

        repr_dict = dict()
        repr_dict.update({'main': serializer.data})

        if not bool(serializer_extended.data):
            ext = {
                "instructor": None,
                "description": None,
                "status": None,
                "instructed": None,
                "name": None,
                "start_date": None,
                "end_date": None,
                "datestatus": None,
                "dateinstructed": None,
                "hints_video": None,
            }
            repr_dict.update({'ext': ext})
        else:
            repr_dict.update({'ext': serializer_extended.data})

        repr_dict.update({'history': serializers.FactStudentChallengeHistorySerializer(
            models.FactStudentChallengeHistory.objects.filter(student_id=student_pk, challenge_id=challenge_pk).order_by('-pk'),
            many=True
        ).data})

        return Response(repr_dict)

    @api_view(['POST'])
    # @parser_classes((PlainTextParser, JsonParser))
    def update_challenge_status(self):
        pif = None
        data = self.data

        fact_challenge = models.FactStudentChallenge.objects.filter(
            challenge_id=int(data.get('challenge_id')),
            student_id=int(data.get('student_id'))
        ).first()

        if fact_challenge is None:
            fact_challenge = models.FactStudentChallenge()
            fact_challenge.challenge_id = int(data.get('challenge_id'))
            fact_challenge.student_id = int(data.get('student_id'))
        fact_challenge.instructor = models.FeatureInstructor.objects.filter(user=self.user).first()

        flag = self.data.get('passed', None)
        if flag:
            fact_challenge.passed = flag
            fact_challenge.pass_date = timezone.now()
            pif = 'passed'
            if not fact_challenge.instructed:
                fact_challenge.instructed = flag
                fact_challenge.instructed_date = timezone.now()

        flag = self.data.get('instructed', None)
        if flag:
            fact_challenge.instructed = flag
            fact_challenge.instructed_date = timezone.now()
            pif = 'instructed'

        fact_challenge.save()

        history = models.FactStudentChallengeHistory()
        history.challenge_id = fact_challenge.challenge_id
        history.student_id = fact_challenge.student_id
        history.instructor = fact_challenge.instructor
        history.passed = fact_challenge.passed
        history.pass_date = fact_challenge.pass_date
        history.instructed = fact_challenge.instructed
        history.instructed_date = fact_challenge.instructed_date
        history.hints_video = fact_challenge.hints_video
        history.status_flag = pif or None
        history.save()

        return Response({'success': True})

    @api_view(['POST'])
    def update_video_url(self):
        challenge = models.FeatureChallenge.objects.filter(
            id=int(self.data.get('challenge_id')),
        ).first()

        if challenge is None:
            Response({'success': False, 'message': 'Something went wrong [CHALLENGE]!'})

        hints_video = self.data.get('vurl', None)   # check video.pg/1/2/3/4/5
        if hints_video:
            challenge.hints_video = hints_video
        else:
            return Response({'success': False, 'message': 'Something went wrong [VIDEO]!'})

        info = self.data.get('info', None)   # make safe
        if info:
            challenge.hints = info
        else:
            return Response({'success': False, 'message': 'Something went wrong [INFO]!'})

        challenge.save()

        # history.save()

        return Response({'success': True})

    @api_view(['POST'])
    def update_student_challenge_video_url(self):
        pif = None
        data = self.data

        fact_challenge = models.FactStudentChallenge.objects.filter(
            challenge_id=int(data.get('challenge_id')),
            student_id=int(data.get('student_id'))
        ).first()

        if fact_challenge is None:
            fact_challenge = models.FactStudentChallenge()
            fact_challenge.challenge_id = int(data.get('challenge_id'))
            fact_challenge.student_id = int(data.get('student_id'))
        fact_challenge.instructor = models.FeatureInstructor.objects.filter(user=self.user).first()

        hints_video = data.get('vurl', None)   # check go.avi/1/2/3/4/5
        if hints_video:
            fact_challenge.hints_video = hints_video
        else:
            Response({'success': False, 'message': 'Something went wrong [VIDEO]!'})

        fact_challenge.save()

        if fact_challenge.passed is True:
            pif = 'passed'
        if fact_challenge.instructed is True:
            pif = 'instructed'

        history = models.FactStudentChallengeHistory()
        history.challenge_id = fact_challenge.challenge_id
        history.student_id = fact_challenge.student_id
        history.instructor = fact_challenge.instructor
        history.passed = fact_challenge.passed
        history.pass_date = fact_challenge.pass_date
        history.instructed = fact_challenge.instructed
        history.instructed_date = fact_challenge.instructed_date
        history.hints_video = fact_challenge.hints_video
        history.status_flag = pif or None
        history.save()

        return Response({'success': True})


class UserGeneric(generics.RetrieveAPIView):

    def get(self, request):
        # serializer = serializers.UserSerializer(request.user)
        instructor = models.FeatureInstructor.objects.filter(user=request.user).first()
        if instructor:
            serializer = serializers.FeatureInstructorSerializer(instructor)
        else:
            return Response({'user': serializers.UserSerializer(request.user).data})

        return Response(serializer.data)

    # def get_queryset(self):
    #     return models.FeatureProgression.objects.all()
    #
    # def retrieve(self, request, *args, **kwargs):
    #     instance = self.get_object()
    #     serializer = serializers.FeatureProgressionDetailedSerializer(instance)
    #     return Response(serializer.data)


class CreateUserView(generics.CreateAPIView):

    model = get_user_model()
    permission_classes = [
        permissions.AllowAny   # Or anon users can't register
    ]
    serializer_class = serializers.UserSerializer


class CreateInstructorView(generics.CreateAPIView):

    model = models.FeatureInstructor
    permission_classes = [
        permissions.AllowAny   # Or anon users can't register
    ]
    serializer_class = serializers.FeatureInstructorSerializer