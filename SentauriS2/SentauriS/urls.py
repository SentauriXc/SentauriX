# sentauri/urls.py

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('centauri.urls')),  # Asegúrate de que esta línea esté incluida
    path('', include('centauri.urls')),      # Incluir también las rutas generales de centauri para el frontend
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)