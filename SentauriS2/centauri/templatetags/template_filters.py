# centauri/templatetags/template_filters.py
from django import template

register = template.Library()

@register.filter
def format_price(value):
    """
    Formatea un precio como '22.000' en lugar de '22000.00'.
    """
    try:
        # Convertir a número decimal si es posible
        value = float(value)
        # Formatear con separador de miles y sin decimales
        return "{:,.0f}".format(value).replace(",", ".")
    except (ValueError, TypeError):
        return value  # Si falla, devolver el valor original
