# coding=utf-8
from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.db import models
from transliterate import translit, get_available_language_codes
from ckeditor_uploader.fields import RichTextUploadingField
# Create your models here.
from django.db.models.signals import post_save, pre_save
from django.utils.text import slugify


class Notice(models.Model):
    title = models.CharField(max_length=500, verbose_name='Заголовок')
    description = RichTextUploadingField(verbose_name='Описание')
    mens = models.ManyToManyField(User, verbose_name='Участники', related_name='mens')
    created_at = models.DateTimeField(auto_now_add='True')
    time = models.DateTimeField(verbose_name='Дата наступления')
    file = models.FileField(upload_to='files/', verbose_name='Прикрепить файл', null=True, blank=True)
    to_user = models.ForeignKey(User, related_name='to_user', null=True)
    slug = models.SlugField(unique=True, null=True)

    class Meta:
        verbose_name_plural='Напоминалки'

    def __unicode__(self):
        return self.title


def notice_post_saved_receiver(sender, instance, *args, **kwargs):
    print sender
    instance.slug = slugify(translit(instance.title, 'ru', reversed=True))


pre_save.connect(notice_post_saved_receiver, sender=Notice)


class Notice_Place(models.Model):
    dolgota = models.CharField(max_length=500, verbose_name='Долгота')
    wirota = models.CharField(max_length=500, verbose_name='Широта')
    notice = models.OneToOneField(Notice)

    class Meta:
        verbose_name_plural='Месторасположение'


class User_Profile(models.Model):
    img = models.ImageField(upload_to='images/', verbose_name='Аватар', null=True, blank=True)
    phone = models.CharField(max_length=400, verbose_name='Телефон', null=True, blank=True)
    for_user = models.OneToOneField(User)

    class Meta:
        verbose_name_plural='Профили пользователей'

    def __unicode__(self):
        return self.for_user.username

    def get_absolute_url(self):
        return reverse("user_profile", kwargs={"pk": self.pk})


def user_profile_post_saved_receiver(instance, *args, **kwargs):
    try:
        profile = User_Profile.objects.get(for_user=instance)
    except:
        profile = User_Profile.objects.create(for_user=instance)
    return profile


post_save.connect(user_profile_post_saved_receiver, sender=User)



