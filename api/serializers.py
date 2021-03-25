from django.contrib.auth import get_user_model
from rest_framework import serializers
from sorl.thumbnail import get_thumbnail
from structaq.models import *
import api.views as api
from structaq.utils import clean_filename


class ChallengeTypeSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'short',
            'name',
        )
        model = ChallengeType


class AnswerTypeSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'short',
            'name',
        )
        model = AnswerType


class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        # print('validated_data -> ', validated_data)
        user = get_user_model().objects.create(
            username=validated_data['username']
        )
        user.set_password(validated_data['password'])
        user.is_active = False
        user.save()

        return user

    class Meta:
        fields = (
            "id",
            "last_login",
            "username",
            # "password",
            "first",
            "middle",
            "last",
            "name",
            "email",
            "birthdate",
            "student",
            "family",
            "instructor",
            "management",
            "startdate",
            "enddate",
        )
        model = User


class FeatureProgressionSerializer(serializers.ModelSerializer):
    students_amount = serializers.SerializerMethodField()

    def get_students_amount(self, progression):
        return progression.feature_progression_student.count()

    class Meta:
        fields = (
            'id',
            'short',
            'name',
            'students_amount',
        )
        model = FeatureProgression


class FeatureProgressionSearchSerializer(serializers.ModelSerializer):
    students_amount = serializers.SerializerMethodField()

    def get_students_amount(self, progression):
        return progression.feature_progression_student.count()

    class Meta:
        fields = (
            'id',
            'short',
            'name',
            'students_amount'
        )
        model = FeatureProgression


class FeatureStudentSerializer(serializers.ModelSerializer):
    # user = serializers.SerializerMethodField()
    img = serializers.SerializerMethodField()

    def get_img(self, obj):
        return "/media/%s" % (get_thumbnail(obj.photo if obj.photo else 'avatar.png', '120x120', quality=99),)

    def get_user(self, feature_student):
        serializer = UserSerializer
        return serializer(feature_student.user).data

    class Meta:
        fields = '__all__'
        model = FeatureStudent


class FeatureProgressionDetailedSerializer(serializers.ModelSerializer):
    students = serializers.SerializerMethodField()

    def get_students(self, progression):
        user_ids = [i[0] for i in
                    FeatureStudentProgression.objects.filter(progression=progression).values_list('student_id')]

        users = FeatureStudent.objects.filter(id__in=user_ids).order_by('first_name')

        return FeatureStudentSerializer(users, many=True).data

    class Meta:
        fields = (
            'id',
            'short',
            'name',
            'students'
        )
        model = FeatureProgression


class FeatureInstructorSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    img = serializers.SerializerMethodField()

    def get_img(self, obj):
        return "/media/%s" % (get_thumbnail(obj.photo if obj.photo else 'avatar.png', '40x40', quality=99),)

    def create(self, validated_data):
        user = UserSerializer(data=validated_data)

        if user.is_valid():
            user.save()
            print('user -> ', user)

        instructor = FeatureInstructor.objects.create(
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            full_name=validated_data['first_name'] + ' ' + validated_data['last_name'],
            birthdate=validated_data['birthdate'],
            user=UserSerializer({"username": validated_data['user']['username'], "password": validated_data['user']['password']})
        )

        instructor.active = False
        instructor.save()

        return instructor

    class Meta:
        fields = (
            'id',
            "first_name",
            "middle_name",
            "last_name",
            "full_name",
            "birthdate",
            "photo",
            'img',
            "user"
        )
        model = FeatureInstructor


class FeatureCurriculumListSerializer(serializers.ModelSerializer):
    img = serializers.SerializerMethodField()

    def get_img(self, obj):
        return "/media/%s" % (get_thumbnail(obj.belt if obj.belt else 'no-belt.png', '120x60', quality=99),)

    class Meta:
        fields = (
            'id',
            'short',
            'name',
            'order',
            'belt',
            'img',
        )
        model = FeatureCurriculum


class FeatureChallengeListSerializer(serializers.ModelSerializer):
    answertype = AnswerTypeSerializer()
    challengetype = ChallengeTypeSerializer()
    hints_video = serializers.SerializerMethodField()

    def get_hints_video(self, challenge):
        return challenge.hints_video

    class Meta:
        fields = '__all__'
        model = FeatureChallenge


class FactStudentChallengeSerializer(serializers.ModelSerializer):
    instructor = serializers.SerializerMethodField()
    description = serializers.SerializerMethodField()
    status = serializers.SerializerMethodField()
    instructed = serializers.SerializerMethodField()
    name = serializers.SerializerMethodField()
    # date = serializers.SerializerMethodField()
    start_date = serializers.SerializerMethodField()
    end_date = serializers.SerializerMethodField()
    datestatus = serializers.SerializerMethodField()
    dateinstructed = serializers.SerializerMethodField()
    hints_video = serializers.SerializerMethodField()

    def get_hints_video(self, challenge):
        return api.S3Service.create_url(
            api.S3Service.get_s3_client(),
            challenge.hints_video
        ) if challenge.hints_video else None

    def get_instructor(self, challenge):
        return "%s %s" % (challenge.instructor.first_name, challenge.instructor.last_name,)

    def get_description(self, challenge):
        return challenge.challenge.short

    def get_datestatus(self, challenge):
        return challenge.pass_date if challenge.pass_date else None

    def get_dateinstructed(self, challenge):
        return challenge.instructed_date if challenge.instructed_date else None

    def get_status(self, challenge):
        return "Passed" if challenge.passed else "Not Passed"

    def get_instructed(self, challenge):
        return "Instructed" if challenge.instructed else "Not Instructed"

    def get_name(self, challenge):
        return challenge.challenge.name

    # def get_date(self, challenge):
    #     return challenge.enddate if challenge.passed else challenge.startdate

    def get_start_date(self, challenge):
        return challenge.startdate

    def get_end_date(self, challenge):
        return challenge.enddate

    class Meta:
        fields = (
            'instructor',
            'description',
            'status',
            'instructed',
            'name',
            # 'date',
            'start_date',
            'end_date',
            'datestatus',
            'dateinstructed',
            'hints_video'
        )
        model = FactStudentChallenge


class FactStudentChallengeHistorySerializer(serializers.ModelSerializer):
    instructor = serializers.SerializerMethodField()
    description = serializers.SerializerMethodField()
    status = serializers.SerializerMethodField()
    instructed = serializers.SerializerMethodField()
    name = serializers.SerializerMethodField()
    # date = serializers.SerializerMethodField()
    datestatus = serializers.SerializerMethodField()
    dateinstructed = serializers.SerializerMethodField()
    hints_video = serializers.SerializerMethodField()

    def get_hints_video(self, challenge):
        return api.S3Service.create_url(
            api.S3Service.get_s3_client(),
            challenge.hints_video
        ) if challenge.hints_video else None

    def get_instructor(self, challenge):
        return "%s %s" % (challenge.instructor.first_name, challenge.instructor.last_name,)

    def get_description(self, challenge):
        return challenge.challenge.short

    def get_datestatus(self, challenge):
        return challenge.pass_date if challenge.pass_date else None

    def get_dateinstructed(self, challenge):
        return challenge.instructed_date if challenge.instructed_date else None

    def get_status(self, challenge):
        return "Passed" if challenge.passed else "Not Passed"

    def get_instructed(self, challenge):
        return "Instructed" if challenge.instructed else "Not Instructed"

    def get_name(self, challenge):
        return challenge.challenge.name

    class Meta:
        fields = (
            'status_flag',
            'instructor',
            'description',
            'status',
            'instructed',
            'name',
            # 'date',
            'datestatus',
            'dateinstructed',
            'hints_video',
        )
        model = FactStudentChallengeHistory


class FactStudentCurriculumSerializer(serializers.ModelSerializer):
    student = FeatureStudentSerializer()
    curriculum = FeatureCurriculumListSerializer()

    class Meta:
        fields = '__all__'
        model = FactStudentCurriculum