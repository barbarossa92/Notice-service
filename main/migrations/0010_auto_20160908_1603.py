# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-08 10:03
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_comment_created_at'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='comment',
            options={'ordering': ['-created_at'], 'verbose_name_plural': '\u041a\u043e\u043c\u043c\u0435\u0442\u0430\u0440\u0438\u0438'},
        ),
        migrations.AddField(
            model_name='comment',
            name='notice_to',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Notice'),
        ),
    ]