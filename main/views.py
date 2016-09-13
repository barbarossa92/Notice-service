import json
import os

from celery.result import AsyncResult
from django.core.urlresolvers import reverse_lazy
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, render_to_response
from django.utils.encoding import smart_str
from django.utils.functional import lazy
from djcelery.views import JsonResponse

from tasks import just_print
from datetime import datetime, timedelta
from .models import *
from django.views import generic
# Create your views here.


class IndexView(generic.TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        return super(IndexView, self).get_context_data(**kwargs)




class ProfileView(generic.DetailView):
    model = User_Profile
    template_name = 'profile.html'

    def get_context_data(self, **kwargs):
        context = super(ProfileView, self).get_context_data(**kwargs)
        return context


class CreateNotice(generic.CreateView):
    model = Notice
    template_name = 'create_note.html'
    fields = ['title', 'description', 'mens', 'time', 'file']
    success_url = reverse_lazy('notice-list')

    def get_context_data(self, **kwargs):
        context = super(CreateNotice, self).get_context_data(**kwargs)
        return context

    def form_valid(self, form):
        form.instance.to_user = self.request.user
        form.instance.file = self.request.FILES.get('file', '')
        return super(CreateNotice, self).form_valid(form)


class NoticeList(generic.ListView):
    model = Notice
    template_name = 'notice-list.html'
    paginate_by = 3

    def get_context_data(self, **kwargs):
        context = super(NoticeList, self).get_context_data(**kwargs)
        return context


class NoticeDetail(generic.DetailView):
    model = Notice
    template_name = 'one_notice.html'

    def get_context_data(self, **kwargs):
        context = super(NoticeDetail, self).get_context_data(**kwargs)
        return context


class DeleteNotice(generic.DeleteView):
    model = Notice
    template_name = 'delete-notice.html'
    success_url = '/notice-list/'


class UpdateNotice(generic.UpdateView):
    model = Notice
    template_name = 'update-notice.html'
    fields = ['title', 'description', 'mens', 'time', 'file',]
    success_url = reverse_lazy('notice-list')


class NoticeInviteList(generic.ListView):
    model = Notice
    template_name = 'invite-list.html'
    paginate_by = 3

    def get_context_data(self, **kwargs):
        context = super(NoticeInviteList, self).get_context_data(**kwargs)
        return context


class NoticeInviteDetail(generic.DetailView):
    model = Notice
    template_name = 'one-invite.html'

    def get_context_data(self, **kwargs):
        context = super(NoticeInviteDetail, self).get_context_data(**kwargs)
        context['object_list'] = Notice.objects.filter(mens=True)
        return context


class UpdateProfile(generic.UpdateView):
    model = User_Profile
    template_name = 'update_profile.html'
    fields = ['img', 'phone', ]

    def get_object(self, *args, **kwargs):
        user = get_object_or_404(User, pk=self.kwargs['pk'])
        return user.user_profile

    def form_valid(self, form):
        form.instance.for_user = self.request.user
        if self.request.POST.get('img-clear'):
            form.instance.img.delete()
        else:
            new_img = self.request.FILES['img']
            img_save = User_Profile(img=new_img)
        return super(UpdateProfile, self).form_valid(form)

    def get_success_url(self):
        pass


# def res_from(request, task_id):
#     result = just_print.AsyncResult(task_id)
#     if result.ready():
#         return HttpResponse('Success!')
    # def get_object(self, queryset=None):
    #     return self.request.user.user_profile


# def download_course(request, slug):
#     notice = Notice.objects.get(slug = slug)
#     path_to_file = get_path_to_notice_download(notice)
#
#     response = HttpResponse(mimetype='application/force-download')
#     response['Content-Disposition'] = 'attachment; filename=%s' % smart_str(file)
#     response['X-Sendfile'] = smart_str(path_to_file)
#     return response
# def check_task(request):
#     result = AsyncResult(request.POST['task_id'])
#     status = result.status
#     traceback = result.traceback
#     result = result.result
#     if isinstance(result, Exception):
#         return HttpResponse(json.dumps({
#             'status': status,
#             'error': str(result),
#             'traceback': traceback,
#         }), content_type='application/json')
#     else:
#         return HttpResponse(json.dumps({
#             'status': status,
#             'result': result,
#         }), content_type='application/json')
