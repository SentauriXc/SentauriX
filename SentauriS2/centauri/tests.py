# centauri/tests.py

from django.test import TestCase
from django.contrib.auth.models import User
from centauri.models import Product, CartItem, Transaction, Profile, UserProfile, Order, OrderItem
from decimal import Decimal


class ProductModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser', password='12345')
        self.product = Product.objects.create(
            title="Camiseta Básica",
            description="Camiseta de algodón básica.",
            price=Decimal('19.99'),
            condition="new",
            category="camisetas",
            seller=self.user
        )

    def test_product_creation(self):
        self.assertEqual(self.product.title, "Camiseta Básica")
        self.assertEqual(self.product.seller.username, "testuser")
        self.assertEqual(str(self.product), "Camiseta Básica")


class CartItemModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser')
        self.product = Product.objects.create(
            title="Pantalón Deportivo",
            description="Pantalón cómodo para hacer deporte.",
            price=Decimal('29.99'),
            condition="like_new",
            category="pantalones",
            seller=self.user
        )
        self.cart_item = CartItem.objects.create(user=self.user, product=self.product, quantity=2)

    def test_cart_item_creation(self):
        self.assertEqual(self.cart_item.quantity, 2)
        self.assertEqual(str(self.cart_item), "2 x Pantalón Deportivo")


class TransactionModelTest(TestCase):
    def setUp(self):
        self.buyer = User.objects.create(username='buyer')
        self.seller = User.objects.create(username='seller')
        self.product = Product.objects.create(
            title="Chaqueta de Invierno",
            description="Chaqueta cálida para invierno.",
            price=Decimal('49.99'),
            condition="good",
            category="chaquetas",
            seller=self.seller
        )
        self.transaction = Transaction.objects.create(buyer=self.buyer, product=self.product, status="pending")

    def test_transaction_creation(self):
        self.assertEqual(self.transaction.status, "pending")
        self.assertEqual(str(self.transaction), f"Transaction {self.transaction.id} - Chaqueta de Invierno")


class ProfileModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='user_with_profile')
        self.profile = Profile.objects.create(user=self.user, bio="Amo la moda.", address="123 Calle Moda")

    def test_profile_creation(self):
        self.assertEqual(self.profile.user.username, "user_with_profile")
        self.assertEqual(str(self.profile), "user_with_profile")


class UserProfileModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='user_with_userprofile')
        self.user_profile = UserProfile.objects.create(user=self.user, phone="123456789", address="456 Calle Fashion")

    def test_user_profile_creation(self):
        self.assertEqual(self.user_profile.phone, "123456789")
        self.assertEqual(str(self.user_profile), "Perfil de user_with_userprofile")


class OrderModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='order_user')
        self.order = Order.objects.create(user=self.user, total_amount=Decimal('100.00'), status="pendiente")

    def test_order_creation(self):
        self.assertEqual(self.order.total_amount, Decimal('100.00'))
        self.assertEqual(str(self.order), f"Pedido {self.order.id} de order_user")


class OrderItemModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='orderitem_user')
        self.product = Product.objects.create(
            title="Falda de Verano",
            description="Falda ligera para verano.",
            price=Decimal('15.99'),
            condition="new",
            category="faldas",
            seller=self.user
        )
        self.order = Order.objects.create(user=self.user, total_amount=Decimal('50.00'), status="pendiente")
        self.order_item = OrderItem.objects.create(order=self.order, product=self.product, quantity=3, price=Decimal('15.99'))

    def test_order_item_creation(self):
        self.assertEqual(self.order_item.quantity, 3)
        self.assertEqual(str(self.order_item), f"3 x Falda de Verano para Pedido {self.order.id}")

