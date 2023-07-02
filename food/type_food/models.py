from django.db import models

class Food(models.Model):
   food_name = models.CharField(max_length=20)
   food_type = models.CharField(max_length=20)
   added_on = models.DateTimeField(auto_now_add=True)
   
   def __str__(self):
       return self.food_name
