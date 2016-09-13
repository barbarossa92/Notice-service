import os
from django.contrib import admin
from django.conf.urls import patterns
from django.conf.urls import url
from django.conf.urls import *
from django.conf.urls.static import static
from django.conf.urls import include
from .views import *
from django.contrib.staticfiles.urls import staticfiles_urlpatterns





urlpatterns = [
    url(r'^$', NoticeListAPIView.as_view(), name='notice-list-api'),
    url(r'^create/$', NoticeCreateAPIView.as_view(), name='notice-create-api'),
    url(r'^(?P<slug>[-_\w]+)/$', NoticeDetailAPIView.as_view(), name='notice-detail-api'),
    url(r'^(?P<slug>[-_\w]+)/edit/$', NoticeUpdateAPIView.as_view(), name='notice-edit-api'),
    url(r'^(?P<slug>[-_\w]+)/delete/$', NoticeDeleteAPIView.as_view(), name='notice-delete-api'),

]