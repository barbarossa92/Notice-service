from rest_framework.serializers import ModelSerializer
from main.models import Notice



class NoticeCreateSerializer(ModelSerializer):
    class Meta:
        model = Notice
        fields=[
            'title',
            'description',
            'time',
            # 'slug',
        ]



class NoticeListSerializer(ModelSerializer):
    class Meta:
        model = Notice
        fields=[
            'title',
            'description',
            'time',
            'slug',
        ]


class NoticeDetailSerializer(ModelSerializer):
    class Meta:
        model = Notice
        fields=[
            'id',
            'title',
            'description',
            'time',
            'slug',
        ]