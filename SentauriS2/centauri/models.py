# centauri/models.py

from django.db import models
from django.contrib.auth.models import User

# Modelo para Producto
class Product(models.Model):

    CATEGORY_CHOICES = [
        ('camisetas', 'Camisetas'),
        ('pantalones', 'Pantalones'),
        ('chaquetas', 'Chaquetas'),
        ('vestidos', 'Vestidos'),
        ('faldas', 'Faldas'),
        ('ropa_interior', 'Ropa Interior'),
        ('ropa_deportiva', 'Ropa Deportiva'),
        ('accesorios', 'Accesorios'),
    ]

    CONDITION_CHOICES = [
        ('new', 'Nuevo'),
        ('like_new', 'Como Nuevo'),
        ('good', 'Bueno'),
        ('fair', 'Aceptable'),
    ]

    title = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    condition = models.CharField(max_length=10, choices=CONDITION_CHOICES)
    image = models.ImageField(upload_to='products/', blank=True, null=True)
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES, default='camisetas')
    seller = models.ForeignKey(User, on_delete=models.CASCADE, related_name='products')
    created_at = models.DateTimeField(auto_now_add=True)

    def formatted_price(self):
        """
        Devuelve el precio formateado como '22.000'.
        """
        return "{:,.0f}".format(self.price).replace(",", ".")
    def __str__(self):
        return self.title

class CartItem(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='cart_items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    added_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.quantity} x {self.product.title}"

# Modelo para Transacción
class Transaction(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Pendiente'),
        ('shipped', 'Enviado'),
        ('completed', 'Completado'),
        ('canceled', 'Cancelado'),
    ]

    buyer = models.ForeignKey(User, on_delete=models.CASCADE, related_name='purchases')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    transaction_date = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Transaction {self.id} - {self.product.title}"

# Modelo para Perfil de Usuario (extensión de Django User)
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField(blank=True)
    address = models.CharField(max_length=255, blank=True)
    phone = models.CharField(max_length=15, blank=True)
    profile_image = models.ImageField(upload_to='products/profile_pics/', blank=True, null=True)

    def __str__(self):
        return self.user.username

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, blank=True)
    address = models.TextField(blank=True)
    profile_picture = models.ImageField(upload_to='profile_pics/', blank=True, null=True)


    def __str__(self):
        return f"Perfil de {self.user.username}"

class Order(models.Model):
        user = models.ForeignKey(User, on_delete=models.CASCADE)
        created_at = models.DateTimeField(auto_now_add=True)
        total_amount = models.DecimalField(max_digits=10, decimal_places=2)
        status = models.CharField(max_length=20, default='pendiente')  # Estado del pedido

        def __str__(self):
            return f"Pedido {self.id} de {self.user.username}"

class OrderItem(models.Model):
        order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')
        product = models.ForeignKey('Product', on_delete=models.CASCADE)
        quantity = models.PositiveIntegerField()
        price = models.DecimalField(max_digits=10, decimal_places=2)

        def __str__(self):
            return f"{self.quantity} x {self.product.title} para Pedido {self.order.id}"

class CardTransaction(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='card_transactions')
    card_holder_name = models.CharField(max_length=100)
    card_number = models.CharField(max_length=16)
    expiration_date = models.CharField(max_length=5)  # formato MM/YY
    cvv = models.CharField(max_length=4)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=20, default='PENDING')  # PENDING, APPROVED, DECLINED
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Transacción de {self.user.username} por ${self.amount}"

class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="notifications")
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    def __str__(self):
        return f"Notificación para {self.user.username}: {self.message[:50]}"