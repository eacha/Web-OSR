from django.conf.urls import include, url
from django.contrib import admin

from graphs import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]