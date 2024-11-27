# centauri/urls.py
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.urls import include
from django.urls import path
from rest_framework.routers import DefaultRouter

from . import views
from .views import ProductViewSet, UserViewSet
from .views import add_to_cart, view_cart, remove_from_cart
from .views import catalog_view, product_detail_view
from .views import checkout_view
from .views import create_product_view
from .views import notifications_view, mark_notification_as_read
from .views import order_confirmation_view
from .views import profile_view, edit_product_view
from .views import register_view

router = DefaultRouter()
router.register(r'products', ProductViewSet)
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('catalog/', catalog_view, name='catalog'),
    path('product/<int:product_id>/', product_detail_view, name='product_detail'),
    path('profile/', profile_view, name='profile'),
    path('register/', register_view, name='register'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    # Rutas del carrito, catálogo, etc.
    path('cart/', view_cart, name='cart'),
    path('cart/add/<int:product_id>/', add_to_cart, name='add_to_cart'),
    path('cart/remove/<int:cart_item_id>/', remove_from_cart, name='remove_from_cart'),
    path('checkout/', checkout_view, name='checkout'),
    path('order/confirmation/<int:order_id>/', order_confirmation_view, name='order_confirmation'),
    path('create_product/', create_product_view, name='create_product'),
    path('profile/', views.profile_view, name='profile'),
    path('notifications/', notifications_view, name='notifications'),
    path('notifications/<int:notification_id>/read/', mark_notification_as_read, name='mark_notification_as_read'),
    path('product/edit/<int:product_id>/', views.edit_product_view, name='edit_product'),
    path('profile/', profile_view, name='profile'),
    path('product/edit/<int:product_id>/', edit_product_view, name='edit_product'),
    path('orders/<int:order_id>/', views.order_detail_view, name='order_detail'),
    path('profile/<str:username>/', views.public_profile_view, name='public_profile'),
    path('profile/<str:username>/', views.public_profile_view, name='profile'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
