import operator
from datetime import datetime
from functools import reduce
from os.path import splitext
from urllib.parse import urlparse

import boto3
from adminsortable2.admin import SortableAdminMixin
from django import forms
from django.contrib import admin, messages
from django.contrib.auth import get_user_model
from django.contrib.auth.models import Group, Permission
from django.db.models import Q
from django.forms import ModelForm, CharField
from django.utils.safestring import mark_safe
from django_admin_listfilter_dropdown.filters import RelatedDropdownFilter
from sorl.thumbnail import get_thumbnail
from sorl.thumbnail.admin import AdminImageMixin
from urllib3.util import url

from structaq.models import *


admin.site.unregister(Group)


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'first', 'middle', 'last', 'email', 'birthdate', 'student', 'family', 'instructor', 'management', 'is_superuser', 'status', 'startdate', 'enddate', )
    exclude = ('last_login', 'groups', 'password', 'first_name', 'last_name', 'user_permissions', 'name', )
    search_fields = (
       'username',
       'email',
       'first',
       'middle',
       'last',
    )

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return False
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return False
        if request.user.instructor:
            return False

        return False

    def save_model(self, request, obj, form, change):
        if obj.id is None:
            obj.save()
        obj.user_permissions.clear()
        if obj.instructor:
            obj.is_staff = False
        if obj.management:
            obj.is_staff = True
            query = reduce(operator.or_, (Q(codename__icontains=item) for item in settings.permission_items))
            r = Permission.objects.filter(query)
            for item in r:
                obj.user_permissions.add(item)

        obj.save()


admin.site.register(User, UserAdmin)


class AnswerTypeAdmin(admin.ModelAdmin):
    list_display = ('short', 'name', )
    search_fields = (
       'name',
       'short',
    )

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(AnswerType, AnswerTypeAdmin)


class ChallengeTypeAdmin(SortableAdminMixin, admin.ModelAdmin):
    list_display = ('short', 'name', )
    search_fields = (
       'name',
       'short',
    )

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(ChallengeType, ChallengeTypeAdmin)


class FeatureProgressionAdmin(SortableAdminMixin, admin.ModelAdmin):
    list_display = ('short', 'name', 'order', )
    search_fields = (
       'name',
       'short',
    )

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureProgression, FeatureProgressionAdmin)


class FeatureChallengeCurriculumAdmin(SortableAdminMixin, admin.ModelAdmin):
    s3_client = boto3.client('s3')

    def video_html(self, obj):
        # href = None
        # if obj.hints_video:
        #     parsed = urlparse(obj.hints_video)
        #     root, ext = splitext(parsed.path)
        #     r = root.split('/')
        #     filename = r.pop()
        #     content_type = r.pop()
        #     up_down_load = r.pop()
        #     print('{}/{}/{}{}'.format(up_down_load, content_type, filename, ext))
        #
        #     href = self.s3_client.generate_presigned_url(
        #         'get_object',
        #         Params={
        #             'Bucket': settings.AWS_STORAGE_BUCKET_NAME,
        #             'key': '{}/{}/{}{}'.format(up_down_load, content_type, filename, ext),
        #         },
        #         ExpiresIn=settings.S3_OBJECT_EXPIRATION
        #     )

        return '-' if not obj.hints_video else mark_safe(
            u"<a target='_blank' rel='noopener noreferrer' href='{0}'>{0}</a>".format(obj.hints_video)
        )

    # change_list_filter_template = "admin/filter_listing.html"
    list_display = ('progression', 'curriculum', 'challenge', 'order', )
    search_fields = (
        'progression__name',
        'curriculum__name',
        'challenge__name'
    )

    raw_id_fields = ('progression', 'curriculum', 'challenge',)
    autocomplete_lookup_fields = {
        'fk': ['progression', 'curriculum', 'challenge'],
    }

    # list_filter = (GroupFilter, CategoryFilter, 'printed', 'sent', 'opened',)
    # list_editable = ('sent', 'opened', 'order')

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureChallengeCurriculum, FeatureChallengeCurriculumAdmin)


class FeatureCurriculumAdmin(SortableAdminMixin, admin.ModelAdmin):
    def image_thumbnail(self, obj):
        im = get_thumbnail(obj.belt if obj.belt else 'no-belt.png', '120x120', quality=99)
        return mark_safe(u"<img src='/media/%s' />" % im)

    image_thumbnail.allow_tags = True
    image_thumbnail.short_description = 'Thumbnail'

    list_display = ('image_thumbnail', 'short', 'name', 'order', 'progression', 'belt', )
    search_fields = (
       'name',
       'short',
    )

    raw_id_fields = ('progression',)
    autocomplete_lookup_fields = {
        'fk': ['progression'],
    }

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureCurriculum, FeatureCurriculumAdmin)


class FeatureStudentProgressionAdmin(admin.ModelAdmin):
    list_display = ('student', 'progression', 'startdate', 'enddate', 'active', )
    search_fields = (
       'student__username',
    )

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureStudentProgression, FeatureStudentProgressionAdmin)


class FactStudentCurriculumAdmin(admin.ModelAdmin):
    list_display = ('student', 'progression', 'curriculum', 'startdate', 'enddate', 'active', )
    search_fields = (
        'student__full',
        'progression__name',
        'curriculum__name'
    )

    raw_id_fields = ('progression', 'curriculum', 'student',)
    autocomplete_lookup_fields = {
        'fk': ['progression', 'curriculum', 'student'],
    }

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FactStudentCurriculum, FactStudentCurriculumAdmin)


class FactStudentChallengeAdmin(admin.ModelAdmin):
    list_display = ('student', 'challenge', 'instructor', 'passed', 'pass_date', 'instructed', 'instructed_date', 'startdate', 'enddate', 'active', )
    search_fields = (
        'student__full',
        'challenge__name',
        'instructor__full'
    )

    raw_id_fields = ('student', 'challenge', 'instructor',)
    autocomplete_lookup_fields = {
        'fk': ['student', 'challenge', 'instructor'],
    }

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FactStudentChallenge, FactStudentChallengeAdmin)


class FactStudentChallengeHistoryAdmin(admin.ModelAdmin):
    list_display = ('status_flag', 'student', 'challenge', 'instructor', 'passed', 'pass_date', 'instructed', 'instructed_date', 'active', )
    search_fields = (
        'student__full',
        'challenge__name',
        'instructor__full',
        'status_flag',
    )

    raw_id_fields = ('student', 'challenge', 'instructor',)
    autocomplete_lookup_fields = {
        'fk': ['student', 'challenge', 'instructor'],
    }

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FactStudentChallengeHistory, FactStudentChallengeHistoryAdmin)


class FeatureChallengeAdmin(SortableAdminMixin, admin.ModelAdmin):
    def video_html(self, obj):
        # return '-' if not obj.hints_video else mark_safe(u"<a target='_blank' rel='noopener noreferrer' href='{0}'>{0}</a>".format(obj.hints_video))
        return '-' if not obj.hints_video else mark_safe(u"<video src='{}' controls width='200' height='150'></video>".format(obj.hints_video))

    video_html.allow_tags = True
    video_html.short_description = 'video'

    list_display = ('short', 'name', 'order', 'active', 'answertype', 'answer', 'challengetype', 'hints', 'video_html', )
    search_fields = (
        'short',
        'name',
    )

    raw_id_fields = ('challengetype',)
    autocomplete_lookup_fields = {
        'fk': ['challengetype'],
    }

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureChallenge, FeatureChallengeAdmin)


class AddSIForm(ModelForm):
    username = CharField(label='username(login)', widget=forms.TextInput(attrs={'class': 'vTextField'}), required=False)
    password = CharField(label='password(login)', widget=forms.TextInput(attrs={'class': 'vTextField'}), required=False)

    student = False
    instructor = False

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.data and self.data.get('username', None) is not None and self.data.get('password', None) is not None:
            self.fields.get('username').required = True
            self.fields.get('password').required = True

    def clean(self):
        if 'username' in self.cleaned_data.keys() and self.instance.user_id is None:
            username = self.cleaned_data.pop('username')
            password = self.cleaned_data.pop('password')
            usermodel = get_user_model()
            user, created = usermodel.objects.get_or_create(username=username)
            if not created:
                raise forms.ValidationError('USER {} already exists!'.format(username))

            user.student = self.student
            user.instructor = self.instructor
            user.set_password(password)
            user.save()

            return self.cleaned_data.update({'user': user})

        return self.cleaned_data


class FeatureInstructorAdmin(admin.ModelAdmin):
    form = AddSIForm

    # change_form_template = "admin/change_form.html"

    def image_thumbnail(self, obj):
        im = get_thumbnail(obj.photo if obj.photo else 'avatar.png', '80x80', quality=99)
        return mark_safe(u"<img src='/media/%s' />" % im)

    def un(self, obj):
        return obj.user.get_username()

    un.short_description = 'USERNAME(LOGIN)'
    un.admin_order_field = 'user'

    image_thumbnail.allow_tags = True
    image_thumbnail.short_description = 'Thumbnail'

    list_display = ('image_thumbnail', 'full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'startdate', 'enddate', 'active', 'user', 'photo', )
    search_fields = (
       'full_name',
    )

    raw_id_fields = ('user',)
    autocomplete_lookup_fields = {
        'fk': ['user'],
    }

    su_fs = ('full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'active', 'user', 'photo',)
    ru_fs = ('full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'active', 'photo',)

    def get_form(self, request, obj=None, **kwargs):
        return super().get_form(request, obj, **kwargs)

    def add_view(self, request, form_url='', extra_context=None):
        self.fields = self.su_fs if request.user.is_superuser else ('username', 'password',) + self.ru_fs
        self.exclude = ('username', 'password',) if request.user.is_superuser else ('user',)
        self.form.student = False
        self.form.instructor = True
        return super().add_view(request, form_url='', extra_context=extra_context)

    def change_view(self, request, object_id, form_url='', extra_context=None):
        self.fields = self.su_fs
        self.exclude = ('username', 'password',)
        self.readonly_fields = () if request.user.is_superuser else ('user',)
        self.form.student = False
        self.form.instructor = True
        return super().change_view(request, object_id, form_url=form_url, extra_context=extra_context)

    def changelist_view(self, request, extra_context=None):
        if not request.user.is_superuser:
            self.list_display = ('image_thumbnail', 'full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'un', 'active', 'photo', )
            self.exclude = ['user']
        return super().changelist_view(request, extra_context)

    def save_model(self, request, obj, form, change):
        if not change:
            form.instructor = True
            obj.user = form.cleaned_data.get('user', None)
        return super().save_model(request, obj, form, change)

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureInstructor, FeatureInstructorAdmin)


class FeatureStudentAdmin(AdminImageMixin, admin.ModelAdmin):
    form = AddSIForm

    def image_thumbnail(self, obj):
        im = get_thumbnail(obj.photo if obj.photo else 'avatar.png', '120x120', quality=99)
        return mark_safe(u"<img src='/media/%s' />" % im)

    image_thumbnail.allow_tags = True
    image_thumbnail.short_description = 'Thumbnail'

    def un(self, obj):
        return obj.user.get_username()

    un.short_description = 'USERNAME(LOGIN)'
    un.admin_order_field = 'user'

    list_display = ('image_thumbnail', 'full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'startdate', 'enddate', 'active', 'user', 'photo', )
    search_fields = (
       'full_name',
    )

    raw_id_fields = ('user',)
    autocomplete_lookup_fields = {
        'fk': ['user'],
    }

    su_fs = ('full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'active', 'user', 'photo',)
    ru_fs = ('full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'active', 'photo',)

    def get_form(self, request, obj=None, **kwargs):
        return super().get_form(request, obj, **kwargs)

    def add_view(self, request, form_url='', extra_context=None):
        self.fields = self.su_fs if request.user.is_superuser else ('username', 'password',) + self.ru_fs
        self.exclude = ('username', 'password',) if request.user.is_superuser else ('user',)
        self.form.student = True
        self.form.instructor = False
        return super().add_view(request, form_url='', extra_context=extra_context)

    def change_view(self, request, object_id, form_url='', extra_context=None):
        self.fields = self.su_fs
        self.exclude = ('username', 'password',)
        self.readonly_fields = () if request.user.is_superuser else ('user',)
        self.form.student = True
        self.form.instructor = False
        return super().change_view(request, object_id, form_url=form_url, extra_context=extra_context)

    def changelist_view(self, request, extra_context=None):
        if not request.user.is_superuser:
            self.list_display = ('image_thumbnail', 'full_name', 'first_name', 'middle_name', 'last_name', 'birthdate', 'un', 'active', 'photo',)
            self.exclude = ['user']
        return super().changelist_view(request, extra_context)

    def save_model(self, request, obj, form, change):
        if not change:
            form.instructor = True
            obj.user = form.cleaned_data.get('user', None)
        return super().save_model(request, obj, form, change)

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return True
        if request.user.instructor:
            return False

        return False


admin.site.register(FeatureStudent, FeatureStudentAdmin)


class MainTableAdmin(admin.ModelAdmin):
    # change_list_filter_template = "admin/filter_listing.html"
    change_list_template = "admin/change_list_filter_sidebar.html"
    actions = None
    list_display = ('student', 'progression', 'curriculum', 'startdate', 'enddate', 'active',)
    search_fields = (
        'student__full',
        'progression__name',
        'curriculum__name'
    )

    raw_id_fields = ('progression', 'curriculum', 'student',)
    autocomplete_lookup_fields = {
        'fk': ['progression', 'curriculum', 'student'],
    }

    fieldsets = [
        (None, {'fields': ()}),
    ]

    list_filter = (
        ('progression', RelatedDropdownFilter),
        ('student', RelatedDropdownFilter),
        ('curriculum', RelatedDropdownFilter),
    )

    def __init__(self, *args, **kwargs):
        super(MainTableAdmin, self).__init__(*args, **kwargs)
        self.list_display_links = None

    def change_view(self, request, object_id, extra_context=None):
        extra_context = extra_context or {}
        extra_context['readonly'] = True
        extra_context['show_save_and_continue'] = False
        extra_context['show_save'] = False
        extra_context['show_delete'] = False

        return super(MainTableAdmin, self).change_view(request, object_id, extra_context=extra_context)

    def has_add_permission(self, request, obj=None):
        return False

    def has_module_permission(self, request):
        if request.user.is_anonymous:
            return False
        if request.user.is_superuser:
            return True
        if request.user.management:
            return False
        if request.user.instructor:
            return False

        return False

    def has_view_or_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.management:
            return False
        if request.user.instructor:
            return False

        return False


admin.site.register(MainTable, MainTableAdmin)