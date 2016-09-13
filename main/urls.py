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
    # url(r'^send-call/', 'main.views.call'),
    url(r'^notice-list/edit/(?P<slug>[-_\w]+)/$', UpdateNotice.as_view(), name='notice-update'),
    url(r'^notice-list/delete/(?P<slug>[-_\w]+)/$', DeleteNotice.as_view(), name='notice-delete'),
    url(r'^invite-list/(?P<slug>[-_\w]+)/$', NoticeInviteDetail.as_view(), name='invite-detail'),
    url(r'^invite-list/', NoticeInviteList.as_view(), name='invite-list'),
    url(r'^notice-list/(?P<slug>[-_\w]+)/$', NoticeDetail.as_view(), name='notice-detail'),
    url(r'^notice-list/', NoticeList.as_view(), name='notice-list'),
    url(r'^profile/(?P<pk>\d+)/edit/$', UpdateProfile.as_view(), name='update-profile'),
    url(r'^profile/(?P<pk>\d+)/', ProfileView.as_view(), name='profile'),
    url(r'^create/', CreateNotice.as_view(), name='create_note'),
    url(r'^$', IndexView.as_view(), name='home_page'),
]
