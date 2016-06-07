from django.conf.urls import include, url
from django.contrib import admin

from graphs import views

urlpatterns = [
    url(r'^$', views.index, name='graphs/index'),
    url(r'^http$', views.http_index, name='graphs/http-index'),
    url(r'^web-server/all/(?P<scan>\d+-\d+-\d+)$', views.http_server_all, name='graphs/server/all'),
    url(r'^web-server/(?P<port>[0-9]+)/(?P<scan>\d+-\d+-\d+)$', views.http_server, name='graphs/server'),
    url(r'^web-server/(?P<port>[0-9]+)/(?P<scan>\d+-\d+-\d+)/(?P<version>[\w\s]+)$', views.http_server, name='graphs/server'),
    url(r'^operative-system/all/(?P<scan>\d+-\d+-\d+)$', views.os_server_all, name='graphs/os/all'),
    url(r'^operative-system/(?P<port>[0-9]+)/(?P<scan>\d+-\d+-\d+)$', views.os_server, name='graphs/os'),
    url(r'^device/all/(?P<scan>\d+-\d+-\d+)$', views.device_type_all, name='graphs/device/all'),
    url(r'^device/(?P<port>[0-9]+)/(?P<scan>\d+-\d+-\d+)$', views.device_type, name='graphs/device'),
    url(r'^https/key-bits$', views.certificate_key_bits, name='graphs/https/key-bits'),
    url(r'^https/validation$', views.certificate_validation, name='graphs/https/validation'),
    url(r'^https/cipher-suite$', views.certificate_cipher_suite, name='graphs/https/cipher-suite'),
    url(r'^https/tls_version$', views.certificate_tls_version, name='graphs/https/tls-version'),
    url(r'^https/signature$', views.certificate_signature, name='graphs/https/signature'),
    url(r'^search/(?P<port>[0-9]+)/(?P<ip>([0-9]{1,3}\.){3}[0-9]{1,3})/(?P<date>[\w\-]+)/(?P<direction>[\w]+)$', views.search_partial, name='search/partial'),
    url(r'^search/cert/(?P<ip>([0-9]{1,3}\.){3}[0-9]{1,3})/(?P<date>[\w\-]+)/(?P<direction>[\w]+)$', views.search_partial_cert, name='search/cert/partial'),
    url(r'^search/ip', views.ip_search, name='search/ip'),
    url(r'^search$', views.search, name='search'),
    url(r'^asn$', views.asn, name='graphs/asn'),
]

