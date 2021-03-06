# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-07 10:23
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('main', '0003_notice_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='User_Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.ImageField(upload_to='images/', verbose_name='\u0410\u0432\u0430\u0442\u0430\u0440')),
                ('phone', models.CharField(max_length=400, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('for_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': '\u041f\u0440\u043e\u0444\u0438\u043b\u0438 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0435\u0439',
            },
        ),
        migrations.AlterModelOptions(
            name='notice_files',
            options={'verbose_name_plural': '\u0424\u0430\u0439\u043b\u044b'},
        ),
        migrations.AlterModelOptions(
            name='notice_place',
            options={'verbose_name_plural': '\u041c\u0435\u0441\u0442\u043e\u0440\u0430\u0441\u043f\u043e\u043b\u043e\u0436\u0435\u043d\u0438\u0435'},
        ),
    ]
