# coding=utf-8
from celery.task import task, periodic_task
from django.core.mail import send_mail
from django.core.urlresolvers import reverse
from django.http import HttpResponse
from django.shortcuts import render_to_response, redirect
from djcelery.views import JsonResponse
from pytz import utc
from django.core import serializers
from django_ajax.decorators import ajax
import json

from .models import Notice
from django.utils import timezone
from datetime import datetime, timedelta



@periodic_task(run_every=timedelta(minutes=1))
def just_print():
    note_date = Notice.objects.all()
    now_date = datetime.utcnow().replace(tzinfo=utc, second=00, microsecond=00)
    for time_in in note_date:
        title = time_in.title.encode('utf-8')
        desc = time_in.description.encode('utf-8')
        email = time_in.to_user.email
        title = str(title) + '\n'
        desc = str(desc) + '\n'
        data = {'title':title, 'desc':desc}
        # jsonDict = json.dumps(data)
        if time_in.time == now_date:
            send_mail('From Notice-service', title + desc, 'donnietruth@gmail.com', [email])
            return HttpResponse(json.dumps(data), content_type="application/json")


