from django.urls import path
from django.views.generic import TemplateView

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('home', TemplateView.as_view(template_name='home.html'), name='home'),
]