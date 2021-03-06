# Generated by Django 2.1.4 on 2019-06-17 10:48

import datetime
from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
from django.utils.timezone import utc
import versatileimagefield.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0009_alter_user_last_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first', models.CharField(blank=True, max_length=100, null=True, verbose_name='First Name')),
                ('middle', models.CharField(blank=True, max_length=100, null=True, verbose_name='Middle Name')),
                ('last', models.CharField(blank=True, max_length=100, null=True, verbose_name='Last Name')),
                ('name', models.CharField(blank=True, max_length=255, null=True, verbose_name='Username')),
                ('email', models.CharField(blank=True, max_length=50, verbose_name='Email')),
                ('birthdate', models.DateField(db_index=True, default=None, null=True)),
                ('student', models.BooleanField(default=False)),
                ('family', models.BooleanField(default=False)),
                ('instructor', models.BooleanField(default=False)),
                ('management', models.BooleanField(default=False)),
                ('password', models.CharField(db_index=True, max_length=255)),
                ('status', models.BooleanField(default=True)),
                ('startdate', models.DateTimeField(db_index=True, default=django.utils.timezone.now, verbose_name='Start Date')),
                ('enddate', models.DateTimeField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 480154, tzinfo=utc), verbose_name='End Date')),
                ('first_name', models.CharField(blank=True, max_length=30, null=True, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, null=True, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', null=True, verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', null=True, verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name='date joined')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'Users',
                'verbose_name_plural': 'Users',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='AnswerType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short', models.CharField(db_index=True, max_length=60)),
                ('name', models.CharField(db_index=True, max_length=255)),
            ],
            options={
                'verbose_name': 'Answer Type',
                'verbose_name_plural': 'Answer Type',
            },
        ),
        migrations.CreateModel(
            name='ChallengeType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short', models.CharField(db_index=True, max_length=100)),
                ('name', models.CharField(db_index=True, max_length=255)),
                ('order', models.IntegerField()),
            ],
            options={
                'verbose_name': 'Challenge Type',
                'verbose_name_plural': 'Challenge Type',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='FactStudentChallenge',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('startdate', models.DateTimeField(db_index=True, default=django.utils.timezone.now)),
                ('enddate', models.DateTimeField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 478731, tzinfo=utc))),
                ('passed', models.BooleanField(default=None, null=True)),
                ('pass_date', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('instructed', models.BooleanField(default=None, null=True)),
                ('instructed_date', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('active', models.BooleanField(default=True)),
                ('hints_video', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'verbose_name': 'Fact Student Challenge',
                'verbose_name_plural': 'Fact Student Challenge',
            },
        ),
        migrations.CreateModel(
            name='FactStudentChallengeHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('passed', models.BooleanField(default=None, null=True)),
                ('pass_date', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('instructed', models.BooleanField(default=None, null=True)),
                ('instructed_date', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('active', models.BooleanField(default=True)),
                ('status_flag', models.CharField(default=None, max_length=11, null=True)),
                ('hints_video', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'verbose_name': 'Fact Student Challenge (HISTORY)',
                'verbose_name_plural': 'Fact Student Challenge (HISTORY)',
            },
        ),
        migrations.CreateModel(
            name='FactStudentCurriculum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('startdate', models.DateTimeField(db_index=True, default=django.utils.timezone.now)),
                ('enddate', models.DateTimeField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 478064, tzinfo=utc))),
                ('active', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Fact Student Curriculum',
                'verbose_name_plural': 'Fact Student Curriculum',
            },
        ),
        migrations.CreateModel(
            name='FeatureChallenge',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short', models.CharField(db_index=True, max_length=255)),
                ('name', models.CharField(db_index=True, max_length=255)),
                ('order', models.IntegerField()),
                ('active', models.BooleanField(default=True)),
                ('answer', models.CharField(blank=True, db_index=True, max_length=400, null=True)),
                ('hints', models.TextField(blank=True, null=True)),
                ('hints_video', models.CharField(blank=True, max_length=255, null=True)),
                ('answertype', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='answer_type_rec', to='structaq.AnswerType')),
                ('challengetype', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='challenge_type_rec', to='structaq.ChallengeType')),
            ],
            options={
                'verbose_name': 'Feature Challenge',
                'verbose_name_plural': 'Feature Challenge',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='FeatureChallengeCurriculum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order', models.IntegerField()),
                ('challenge', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_challenge_rec', to='structaq.FeatureChallenge')),
            ],
            options={
                'verbose_name': 'Feature Challenge Curriculum',
                'verbose_name_plural': 'Feature Challenge Curriculum',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='FeatureCurriculum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short', models.CharField(db_index=True, max_length=100)),
                ('name', models.CharField(db_index=True, max_length=255)),
                ('order', models.IntegerField()),
                ('belt', versatileimagefield.fields.VersatileImageField(blank=True, null=True, upload_to='belts', verbose_name='Belt')),
            ],
            options={
                'verbose_name': 'Feature Curriculum',
                'verbose_name_plural': 'Feature Curriculum',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='FeatureInstructor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(db_index=True, max_length=100)),
                ('middle_name', models.CharField(blank=True, db_index=True, max_length=100, null=True)),
                ('last_name', models.CharField(db_index=True, max_length=100)),
                ('full_name', models.CharField(db_index=True, max_length=255)),
                ('birthdate', models.DateField(db_index=True, default=None)),
                ('active', models.BooleanField(default=True)),
                ('startdate', models.DateTimeField(db_index=True, default=django.utils.timezone.now)),
                ('enddate', models.DateTimeField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 475593, tzinfo=utc))),
                ('photo', versatileimagefield.fields.VersatileImageField(blank=True, null=True, upload_to='instructor_photo', verbose_name='Photo')),
                ('user', models.ForeignKey(limit_choices_to={'instructor': True}, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Feature Instructor',
                'verbose_name_plural': 'Feature Instructor',
            },
        ),
        migrations.CreateModel(
            name='FeatureProgression',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('short', models.CharField(db_index=True, max_length=60)),
                ('name', models.CharField(db_index=True, max_length=255)),
                ('order', models.IntegerField()),
            ],
            options={
                'verbose_name': 'Feature Progression',
                'verbose_name_plural': 'Feature Progression',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='FeatureStudent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(db_index=True, max_length=100)),
                ('middle_name', models.CharField(blank=True, db_index=True, max_length=100, null=True)),
                ('last_name', models.CharField(db_index=True, max_length=100)),
                ('full_name', models.CharField(db_index=True, max_length=255)),
                ('birthdate', models.DateField(db_index=True, default=None)),
                ('active', models.BooleanField(default=True)),
                ('startdate', models.DateTimeField(db_index=True, default=django.utils.timezone.now)),
                ('enddate', models.DateTimeField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 476212, tzinfo=utc))),
                ('photo', versatileimagefield.fields.VersatileImageField(blank=True, null=True, upload_to='student_photo', verbose_name='Photo')),
                ('user', models.ForeignKey(limit_choices_to={'student': True}, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Feature Student',
                'verbose_name_plural': 'Feature Student',
            },
        ),
        migrations.CreateModel(
            name='FeatureStudentProgression',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('startdate', models.DateField(db_index=True, default=django.utils.timezone.now)),
                ('enddate', models.DateField(db_index=True, default=datetime.datetime(2020, 6, 16, 10, 48, 34, 476773, tzinfo=utc))),
                ('active', models.BooleanField(default=True, verbose_name='Status (is Active?)')),
                ('progression', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_progression_student', to='structaq.FeatureProgression')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_feat', to='structaq.FeatureStudent')),
            ],
            options={
                'verbose_name': 'Feature Student Progression',
                'verbose_name_plural': 'Feature Student Progression',
            },
        ),
        migrations.AddField(
            model_name='featurecurriculum',
            name='progression',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_progression', to='structaq.FeatureProgression'),
        ),
        migrations.AddField(
            model_name='featurechallengecurriculum',
            name='curriculum',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_curriculum_rec', to='structaq.FeatureCurriculum'),
        ),
        migrations.AddField(
            model_name='featurechallengecurriculum',
            name='progression',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_progression_rec', to='structaq.FeatureProgression'),
        ),
        migrations.AddField(
            model_name='factstudentcurriculum',
            name='curriculum',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_curriculum_fact', to='structaq.FeatureCurriculum'),
        ),
        migrations.AddField(
            model_name='factstudentcurriculum',
            name='progression',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_progression_fact', to='structaq.FeatureProgression'),
        ),
        migrations.AddField(
            model_name='factstudentcurriculum',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_fact', to='structaq.FeatureStudent'),
        ),
        migrations.AddField(
            model_name='factstudentchallengehistory',
            name='challenge',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_challenge_fact_history', to='structaq.FeatureChallenge'),
        ),
        migrations.AddField(
            model_name='factstudentchallengehistory',
            name='instructor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='instructor_rec_history', to='structaq.FeatureInstructor'),
        ),
        migrations.AddField(
            model_name='factstudentchallengehistory',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_rec_history', to='structaq.FeatureStudent'),
        ),
        migrations.AddField(
            model_name='factstudentchallenge',
            name='challenge',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feature_challenge_fact', to='structaq.FeatureChallenge'),
        ),
        migrations.AddField(
            model_name='factstudentchallenge',
            name='instructor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='instructor_rec', to='structaq.FeatureInstructor'),
        ),
        migrations.AddField(
            model_name='factstudentchallenge',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_rec', to='structaq.FeatureStudent'),
        ),
        migrations.CreateModel(
            name='MainTable',
            fields=[
            ],
            options={
                'proxy': True,
                'indexes': [],
            },
            bases=('structaq.factstudentcurriculum',),
        ),
    ]