# centauri/views.py

from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.db.models import Q
from django.http import HttpResponseForbidden
from django.shortcuts import redirect
from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets

from .forms import CustomUserCreationForm, UserProfileForm
from .forms import ProductForm
from .models import CartItem, OrderItem, Notification
from .models import Order
from .models import Product
from .models import UserProfile
from .serializers import ProductSerializer
from .serializers import UserSerializer


class UserViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save(commit=False)
            user.first_name = form.cleaned_data.get('first_name')
            user.last_name = form.cleaned_data.get('last_name')
            user.email = form.cleaned_data.get('email')
            user.save()

            # Crear el perfil de usuario y añadir los campos adicionales
            UserProfile.objects.create(
                user=user,
                phone=form.cleaned_data.get('phone'),
                profile_picture=form.cleaned_data.get('profile_picture')
            )

            # Inicia sesión automáticamente después de registrarse
            login(request, user)
            return redirect('catalog')  # Redirige al catálogo o página de inicio
    else:
        form = CustomUserCreationForm()
    return render(request, 'register.html', {'form': form})

def catalog_view(request):
    # Obtener las categorías desde el modelo Product
    categories = Product.CATEGORY_CHOICES

    # Obtener los parámetros de filtrado de la solicitud GET
    search_query = request.GET.get('search', '')
    category = request.GET.get('category', '')
    min_price = request.GET.get('min_price', '')
    max_price = request.GET.get('max_price', '')
    sort_order = request.GET.get('sort', 'title')  # Orden por defecto por título

    # Construir los filtros de búsqueda
    search_filters = Q(title__icontains=search_query) | Q(description__icontains=search_query)

    # Filtrar por categoría si se especifica
    if category:
        search_filters &= Q(category=category)

    # Filtrar por rango de precios si se especifica
    if min_price:
        search_filters &= Q(price__gte=min_price)
    if max_price:
        search_filters &= Q(price__lte=max_price)

    # Aplicar los filtros y ordenar los productos
    products = Product.objects.filter(search_filters).order_by(sort_order)

    # Pasar productos y categorías al contexto
    return render(request, 'catalog.html', {
        'products': products,
        'categories': categories,  # Nueva línea para pasar categorías al contexto
        'search_query': search_query,
        'category': category,
        'min_price': min_price,
        'max_price': max_price,
        'sort_order': sort_order,
    })

def product_detail_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)

    # Asegúrate de que el perfil del vendedor existe
    user_profile, created = UserProfile.objects.get_or_create(user=product.seller)

    return render(request, 'product_detail.html', {
        'product': product,
        'user_profile': user_profile,  # Incluye el perfil en el contexto
    })

@login_required
def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart_item, created = CartItem.objects.get_or_create(user=request.user, product=product)
    if not created:
        cart_item.quantity += 1  # Incrementa la cantidad si el producto ya está en el carrito
    cart_item.save()
    return redirect('cart')  # Redirige al carrito después de agregar el producto

# centauri/views.py
@login_required
def view_cart(request):
    cart_items = CartItem.objects.filter(user=request.user)
    total = sum(item.product.price * item.quantity for item in cart_items)
    return render(request, 'cart.html', {'cart_items': cart_items, 'total': total})

@login_required
def remove_from_cart(request, cart_item_id):
    cart_item = get_object_or_404(CartItem, id=cart_item_id, user=request.user)
    cart_item.delete()
    return redirect('cart')

@login_required
def checkout_view(request):
    cart_items = CartItem.objects.filter(user=request.user)
    cart_items_with_total = []
    total = 0

    # Calcular el total de cada artículo y el total general
    for item in cart_items:
        item_total = item.product.price * item.quantity
        cart_items_with_total.append({
            'product': item.product,
            'quantity': item.quantity,
            'price': item.product.price,
            'total': item_total
        })
        total += item_total

    # Lista de meses y años para el formulario
    months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    years = ["2024", "2025", "2026", "2027", "2028", "2029", "2030"]

    if request.method == 'POST':
        payment_method = request.POST.get('payment_method')  # Captura el método de pago

        if payment_method == 'card':  # Procesar pago con tarjeta
            card_holder_name = request.POST.get('card_holder_name')
            card_number = request.POST.get('card_number')
            expiration_month = request.POST.get('expiration_month')
            expiration_year = request.POST.get('expiration_year')
            cvv = request.POST.get('cvv')

            # Validar que el CVV tenga exactamente 3 dígitos
            if not (cvv and cvv.isdigit() and len(cvv) == 3):
                return render(request, 'checkout.html', {
                    'cart_items': cart_items_with_total,
                    'total': total,
                    'error': 'El código de seguridad (CVV) debe ser un número de 3 dígitos.',
                    'months': months,
                    'years': years,
                })

            # Validar datos básicos de la tarjeta
            if not all([card_holder_name, card_number, expiration_month, expiration_year, cvv]):
                return render(request, 'checkout.html', {
                    'cart_items': cart_items_with_total,
                    'total': total,
                    'error': 'Por favor, completa todos los campos de la tarjeta.',
                    'months': months,
                    'years': years,
                })

            if card_number.startswith('4'):  # Validación básica de tarjeta
                status = 'APPROVED'
            else:
                status = 'DECLINED'

            if status == 'APPROVED':
                # Crear pedido
                order = Order.objects.create(user=request.user, total_amount=total)
                for item in cart_items:
                    OrderItem.objects.create(
                        order=order,
                        product=item.product,
                        quantity=item.quantity,
                        price=item.product.price
                    )
                cart_items.delete()  # Vaciar el carrito

                return redirect('order_confirmation', order_id=order.id)
            else:
                return render(request, 'checkout.html', {
                    'cart_items': cart_items_with_total,
                    'total': total,
                    'error': 'Transacción rechazada.',
                    'months': months,
                    'years': years,
                })

        elif payment_method == 'normal':  # Procesar pago normal
            order = Order.objects.create(user=request.user, total_amount=total)
            for item in cart_items:
                OrderItem.objects.create(
                    order=order,
                    product=item.product,
                    quantity=item.quantity,
                    price=item.product.price
                )
            cart_items.delete()  # Vaciar el carrito

            return redirect('order_confirmation', order_id=order.id)

    # Renderizar GET
    return render(request, 'checkout.html', {
        'cart_items': cart_items_with_total,
        'total': total,
        'months': months,
        'years': years,
    })
@login_required
def order_confirmation_view(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    return render(request, 'order_confirmation.html', {'order': order})

@login_required
def create_product_view(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.seller = request.user  # Asigna el usuario actual como el vendedor
            product.save()
            return redirect('profile')  # Redirige al perfil después de subir el producto
    else:
        form = ProductForm()
    return render(request, 'create_product.html', {'form': form})

@login_required
def notifications_view(request):
    notifications = request.user.notifications.order_by('-created_at')  # Notificaciones del usuario
    return render(request, 'notifications.html', {'notifications': notifications})

@login_required
def mark_notification_as_read(request, notification_id):
    notification = get_object_or_404(Notification, id=notification_id, user=request.user)
    notification.is_read = True
    notification.save()
    return redirect('notifications')

@login_required
def edit_product_view(request, product_id):
    # Obtener el producto o devolver 404 si no existe
    product = get_object_or_404(Product, id=product_id)

    # Verificar si el usuario autenticado es el propietario del producto
    if product.seller != request.user:
        return HttpResponseForbidden("No tienes permiso para editar este producto.")

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('product_detail', product_id=product.id)
    else:
        form = ProductForm(instance=product)

    return render(request, 'product_edit.html', {'form': form, 'product': product})

@login_required
def profile_view(request):
    user_profile, created = UserProfile.objects.get_or_create(user=request.user)

    if request.method == 'POST':
        profile_form = UserProfileForm(request.POST, request.FILES, instance=user_profile)
        if profile_form.is_valid():
            profile_form.save()
            return redirect('profile')  # Redirige después de guardar
    else:
        profile_form = UserProfileForm(instance=user_profile)

    # Recuperar productos y órdenes asociados al usuario
    products = Product.objects.filter(seller=request.user)
    orders = Order.objects.filter(user=request.user)

    return render(request, 'profile.html', {
        'user_profile': user_profile,
        'profile_form': profile_form,
        'products': products,
        'orders': orders,
    })
@login_required
def order_detail_view(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)  # Asegúrate de que el pedido pertenece al usuario autenticado
    return render(request, 'order_detail.html', {'order': order})

def public_profile_view(request, username):
    user = get_object_or_404(User, username=username)

    # Asegúrate de que el perfil existe
    user_profile, created = UserProfile.objects.get_or_create(user=user)

    # Recuperar productos usando el related_name='products'
    products = user.products.all()  # Cambiado de product_set a products

    return render(request, 'public_profile.html', {
        'profile_user': user,
        'user_profile': user_profile,
        'products': products,
    })