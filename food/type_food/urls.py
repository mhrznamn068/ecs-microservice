from django.urls import path
from .views import food


urlpatterns = [
    path('food/', food, name="foods")
]