from django.shortcuts import render, render_to_response
from django.template import RequestContext


def index(request):
    return render(request, 'index.html')


def handler404(request):
    response = render_to_response('404.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response
