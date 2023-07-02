from rest_framework import serializers
from .models import Food


class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food # this is the model that is being serialized
        fields = ('food_name', 'food_type')