# centauri/admin.py

from django.contrib import admin
from .models import Order, OrderItem
from .models import Product, Transaction, Profile

admin.site.register(Product)
admin.site.register(Transaction)
admin.site.register(Profile)

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'created_at', 'total_amount', 'status')
    list_filter = ('status', 'created_at')
    search_fields = ('user__username',)

@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('order', 'product', 'quantity', 'price')
    search_fields = ('order__id', 'product__title')