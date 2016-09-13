from django.contrib import admin
from .models import *
# Register your models here.


class Notice_placeAdmin(admin.TabularInline):
    model = Notice_Place
    extra = 0
    max_num = 1


class NoticeAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',)}
    inlines = [
        Notice_placeAdmin,
    ]
    search_fields = ['title']

admin.site.register(Notice, NoticeAdmin)
admin.site.register(User_Profile)