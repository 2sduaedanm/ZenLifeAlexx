from django.contrib.auth.models import AbstractUser, User
from django.db import models
from s3direct.fields import S3DirectField
from smart_selects.db_fields import ChainedForeignKey
from django.utils import timezone
from versatileimagefield.fields import VersatileImageField
from django.utils.translation import gettext as _
from TopAdmin import settings


class AnswerType(models.Model):

    short = models.CharField(max_length=60, blank=False, null=False, db_index=True)
    name = models.CharField(max_length=255, blank=False, null=False, db_index=True)

    class Meta:
        verbose_name = 'Answer Type'
        verbose_name_plural = 'Answer Type'

    def __str__(self):
        return '{}'.format(self.name)


class ChallengeType(models.Model):

    short = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    name = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    order = models.IntegerField(blank=False, null=False)

    class Meta:
        verbose_name = 'Challenge Type'
        verbose_name_plural = 'Challenge Type'

        ordering = ['order']

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'short__icontains', 'name__icontains',

    def __str__(self):
        return '{}'.format(self.name)


class FeatureProgression(models.Model):

    short = models.CharField(max_length=60, blank=False, null=False, db_index=True)
    name = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    order = models.IntegerField(blank=False, null=False)

    class Meta:
        verbose_name = 'Feature Progression'
        verbose_name_plural = 'Feature Progression'

        ordering = ['order']

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'name__icontains',

    def __str__(self):
        return '{}'.format(self.name)


class FeatureCurriculum(models.Model):

    short = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    name = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    order = models.IntegerField(blank=False, null=False)
    progression = models.ForeignKey(FeatureProgression, on_delete=models.CASCADE, related_name='feature_progression')
    belt = VersatileImageField('Belt', upload_to='belts', blank=True, null=True)

    class Meta:
        verbose_name = 'Feature Curriculum'
        verbose_name_plural = 'Feature Curriculum'

        ordering = ['order']

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'name__icontains',

    def __str__(self):
        return '{}'.format(self.name)


class FeatureChallenge(models.Model):

    short = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    name = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    order = models.IntegerField(blank=False, null=False)
    active = models.BooleanField(default=True)

    answertype = models.ForeignKey(AnswerType, on_delete=models.CASCADE, related_name='answer_type_rec')
    answer = models.CharField(max_length=400, blank=True, null=True, db_index=True)
    challengetype = models.ForeignKey(ChallengeType, on_delete=models.CASCADE, related_name='challenge_type_rec')

    hints = models.TextField(blank=True, null=True)
    # hints_video = models.CharField(max_length=255, blank=True, null=True)
    hints_video = S3DirectField(dest='destination', blank=True, null=True)

    class Meta:
        verbose_name = 'Feature Challenge'
        verbose_name_plural = 'Feature Challenge'

        ordering = ['order']

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'name__icontains',

    def __str__(self):
        return '{}'.format(self.name)


class FeatureChallengeCurriculum(models.Model):

    progression = models.ForeignKey(FeatureProgression, on_delete=models.CASCADE, related_name='feature_progression_rec')
    curriculum = models.ForeignKey(FeatureCurriculum, on_delete=models.CASCADE, related_name='feature_curriculum_rec')
    challenge = models.ForeignKey(FeatureChallenge, on_delete=models.CASCADE, related_name='feature_challenge_rec')
    order = models.IntegerField(blank=False, null=False)

    # @staticmethod
    # def autocomplete_search_fields():
    #     return ("progression__icontains", "curriculum__icontains", "challenge__icontains", )

    class Meta:
        verbose_name = 'Feature Challenge Curriculum'
        verbose_name_plural = 'Feature Challenge Curriculum'

        ordering = ['order']

    def __str__(self):
        return '{}'.format(self.curriculum.name)


class FeatureInstructor(models.Model):

    first_name = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    middle_name = models.CharField(max_length=100, blank=True, null=True, db_index=True)
    last_name = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    full_name = models.CharField(max_length=255, blank=False, null=False, db_index=True)

    birthdate = models.DateField(default=None, db_index=True)
    active = models.BooleanField(default=True)

    startdate = models.DateTimeField(default=timezone.now, db_index=True)
    enddate = models.DateTimeField(default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)

    user = models.ForeignKey(settings.AUTH_USER_MODEL, limit_choices_to={'instructor': True}, on_delete=models.CASCADE)

    photo = VersatileImageField('Photo', upload_to='instructor_photo', blank=True, null=True)

    class Meta:
        verbose_name = 'Feature Instructor'
        verbose_name_plural = 'Feature Instructor'

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'first_name__icontains', 'middle_name__icontains', 'last_name__icontains', 'full_name__icontains',

    def __str__(self):
        return '{}'.format(self.full_name)


class FeatureStudent(models.Model):

    first_name = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    middle_name = models.CharField(max_length=100, blank=True, null=True, db_index=True)
    last_name = models.CharField(max_length=100, blank=False, null=False, db_index=True)
    full_name = models.CharField(max_length=255, blank=False, null=False, db_index=True)

    birthdate = models.DateField(default=None, db_index=True)
    active = models.BooleanField(default=True)

    startdate = models.DateTimeField(default=timezone.now, db_index=True)
    enddate = models.DateTimeField(default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)

    user = models.ForeignKey(settings.AUTH_USER_MODEL, limit_choices_to={'student': True}, on_delete=models.CASCADE)

    photo = VersatileImageField('Photo', upload_to='student_photo', blank=True, null=True)

    class Meta:
        verbose_name = 'Feature Student'
        verbose_name_plural = 'Feature Student'

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'first_name__icontains', 'middle_name__icontains', 'last_name__icontains', 'full_name__icontains',

    def __str__(self):
        return '{}'.format(self.full_name)


class FeatureStudentProgression(models.Model):

    student = models.ForeignKey(FeatureStudent, on_delete=models.CASCADE, related_name='student_feat')
    progression = models.ForeignKey(FeatureProgression, on_delete=models.CASCADE, related_name='feature_progression_student')
    startdate = models.DateField(default=timezone.now, db_index=True)
    enddate = models.DateField(default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)
    active = models.BooleanField(u"Status (is Active?)", default=True)

    class Meta:
        verbose_name = 'Feature Student Progression'
        verbose_name_plural = 'Feature Student Progression'

    def __str__(self):
        return '{}'.format(self.student)


class FactStudentCurriculum(models.Model):

    student = models.ForeignKey(FeatureStudent, on_delete=models.CASCADE, related_name='student_fact')
    progression = models.ForeignKey(FeatureProgression, on_delete=models.CASCADE, related_name='feature_progression_fact')
    curriculum = models.ForeignKey(FeatureCurriculum, on_delete=models.CASCADE, related_name='feature_curriculum_fact')
    startdate = models.DateTimeField(default=timezone.now, db_index=True)
    enddate = models.DateTimeField(default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Fact Student Curriculum'
        verbose_name_plural = 'Fact Student Curriculum'

    def __str__(self):
        return '{}'.format(self.active)


class FactStudentChallenge(models.Model):

    student = models.ForeignKey(FeatureStudent, on_delete=models.CASCADE, related_name='student_rec')
    challenge = models.ForeignKey(FeatureChallenge, on_delete=models.CASCADE, related_name='feature_challenge_fact')
    instructor = models.ForeignKey(FeatureInstructor, on_delete=models.CASCADE, related_name='instructor_rec')
    startdate = models.DateTimeField(default=timezone.now, db_index=True)
    enddate = models.DateTimeField(default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)
    passed = models.BooleanField(default=None, null=True)
    pass_date = models.DateTimeField(null=True, blank=True, db_index=True)
    instructed = models.BooleanField(default=None, null=True)
    instructed_date = models.DateTimeField(null=True, blank=True, db_index=True)
    active = models.BooleanField(default=True)
    hints_video = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        verbose_name = 'Fact Student Challenge'
        verbose_name_plural = 'Fact Student Challenge'

    def __str__(self):
        return '{}'.format(self.challenge)


class FactStudentChallengeHistory(models.Model):

    student = models.ForeignKey(FeatureStudent, on_delete=models.CASCADE, related_name='student_rec_history')
    challenge = models.ForeignKey(FeatureChallenge, on_delete=models.CASCADE, related_name='feature_challenge_fact_history')
    instructor = models.ForeignKey(FeatureInstructor, on_delete=models.CASCADE, related_name='instructor_rec_history')
    passed = models.BooleanField(default=None, null=True)
    pass_date = models.DateTimeField(null=True, blank=True, db_index=True)
    instructed = models.BooleanField(default=None, null=True)
    instructed_date = models.DateTimeField(null=True, blank=True, db_index=True)
    active = models.BooleanField(default=True)
    status_flag = models.CharField(max_length=11, null=True, default=None)
    hints_video = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        verbose_name = 'Fact Student Challenge (HISTORY)'
        verbose_name_plural = 'Fact Student Challenge (HISTORY)'

    def __str__(self):
        return '{}'.format(self.challenge)


class User(AbstractUser):

    first = models.CharField(u"First Name", max_length=100, blank=True, null=True)
    middle = models.CharField(u"Middle Name", max_length=100, blank=True, null=True)
    last = models.CharField(u"Last Name", max_length=100, blank=True, null=True)
    name = models.CharField(u"Username", max_length=255, blank=True, null=True)

    email = models.CharField(u"Email", max_length=50, blank=True)
    birthdate = models.DateField(default=None, null=True, db_index=True)
    student = models.BooleanField(default=False)
    family = models.BooleanField(default=False)

    instructor = models.BooleanField(default=False)
    management = models.BooleanField(default=False)

    password = models.CharField(max_length=255, blank=False, null=False, db_index=True)
    status = models.BooleanField(default=True)
    startdate = models.DateTimeField(u"Start Date", default=timezone.now, db_index=True)
    enddate = models.DateTimeField(u"End Date", default=(timezone.now() + timezone.timedelta(days=365)), db_index=True)

    first_name = models.CharField(_('first name'), max_length=30, blank=True, null=True)
    last_name = models.CharField(_('last name'), max_length=150, blank=True, null=True)

    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_('Designates whether the user can log into this admin site.'),
        null=True,
    )

    is_active = models.BooleanField(
        _('active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
        null=True,
    )

    date_joined = models.DateTimeField(_('date joined'), default=timezone.now, null=True)

    @staticmethod
    def autocomplete_search_fields():
        return 'id__iexact', 'first__icontains', 'middle__icontains', 'last__icontains', 'name__icontains', 'username__icontains',

    class Meta:
        verbose_name = 'Users'
        verbose_name_plural = 'Users'

    def __str__(self):
        return '{}'.format(self.username)


class MainTable(FactStudentCurriculum):
    class Meta:
        proxy = True