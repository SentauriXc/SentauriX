# centauri/forms.py

import re

from django import forms
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

from .models import UserProfile, Product


def validate_username(value):
    """Validador personalizado para verificar las reglas del nombre de usuario."""
    if len(value) < 8:
        raise ValidationError("El nombre de usuario debe tener al menos 8 caracteres.")
    if len(re.findall(r'\d', value)) < 2:
        raise ValidationError("El nombre de usuario debe incluir al menos 2 números.")
    if not re.search(r'[!@#$%^&*(),.?\":{}|<>]', value) and not value.isalnum():
        raise ValidationError("El nombre de usuario puede opcionalmente contener un carácter especial.")

def validate_colombian_phone(value):
    """Validador para números de teléfono colombianos."""
    pattern = r'^3\d{9}$'  # Coincide con 3 seguido de exactamente 9 dígitos
    if not re.match(pattern, value):
        raise ValidationError(
            "El número debe tener exactamente 10 dígitos y comenzar con '3'."
        )

def validate_phone(value):
    """Validador personalizado para verificar que solo se ingresen números."""
    if not value.isdigit():
        raise ValidationError("El número de teléfono solo debe contener dígitos (0-9).")


class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(
        max_length=30,
        required=True,
        label='Nombre'
    )
    last_name = forms.CharField(
        max_length=30,
        required=True,
        label='Apellido'
    )
    email = forms.EmailField(
        required=True,
        label='Correo Electrónico'
    )
    phone = forms.CharField(
        max_length=10,
        required=True,
        label='Teléfono',
        validators=[validate_colombian_phone],  # Validador para números colombianos
        widget=forms.TextInput(attrs={
            'pattern': r'^3\d{9}$',
            'title': 'Ingrese por favor un numero colombiano.'
        }),
        help_text="Ingrese porfavor un numero colombiano.",
    )
    profile_picture = forms.ImageField(
        required=False,
        label='Foto de Perfil'
    )
    username = forms.CharField(
        max_length=150,
        required=True,
        label="Nombre de Usuario",
        help_text=(
            "Debe tener al menos 8 caracteres, incluir 2 números y puede opcionalmente contener un carácter especial."
        ),
    )

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'phone', 'password1', 'password2']



# Formulario de edición de usuario personalizado
class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']
        labels = {
            'username': 'Nombre de Usuario',
            'first_name': 'Nombre',
            'last_name': 'Apellido',
            'email': 'Correo Electrónico',
        }


# Formulario de edición del perfil del usuario
class UserProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=True, label='Nombre')
    last_name = forms.CharField(max_length=30, required=True, label='Apellido')
    email = forms.EmailField(required=True, label='Correo Electrónico')

    class Meta:
        model = UserProfile
        fields = ['phone', 'profile_picture']

    def __init__(self, *args, **kwargs):
        super(UserProfileForm, self).__init__(*args, **kwargs)
        if self.instance and self.instance.user:
            self.fields['first_name'].initial = self.instance.user.first_name
            self.fields['last_name'].initial = self.instance.user.last_name
            self.fields['email'].initial = self.instance.user.email

    def save(self, commit=True):
        user_profile = super(UserProfileForm, self).save(commit=False)
        user = user_profile.user
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']

        if commit:
            user.save()
            user_profile.save()
        return user_profile


# Formulario de producto
class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['title', 'description', 'price', 'image', 'category', 'condition']

class CreditCardForm(forms.Form):
    card_holder_name = forms.CharField(max_length=100, label="Nombre en la tarjeta")
    card_number = forms.CharField(max_length=16, label="Número de tarjeta")
    expiration_date = forms.CharField(max_length=5, label="Fecha de expiración (MM/YY)")
    cvv = forms.CharField(max_length=4, label="CVV")

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['title', 'description', 'price', 'image', 'category', 'condition']