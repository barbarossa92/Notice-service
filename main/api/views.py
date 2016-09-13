from rest_framework.generics import ListAPIView, UpdateAPIView, RetrieveAPIView, DestroyAPIView, CreateAPIView
from main.models import Notice
from .serializers import NoticeCreateSerializer, NoticeListSerializer, NoticeDetailSerializer


class NoticeCreateAPIView(CreateAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeCreateSerializer


class NoticeDetailAPIView(RetrieveAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeDetailSerializer
    lookup_field = 'slug'


class NoticeUpdateAPIView(UpdateAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeDetailSerializer
    lookup_field = 'slug'


class NoticeDeleteAPIView(DestroyAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeDetailSerializer
    lookup_field = 'slug'


class NoticeListAPIView(ListAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeListSerializer

