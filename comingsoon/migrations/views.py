from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template.loader import get_template


def index(request):
    # return render(request, 'comingsoon/index.html', context={})
    return redirect('/admin')