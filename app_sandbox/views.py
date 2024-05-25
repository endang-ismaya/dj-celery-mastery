from django.shortcuts import render

# Create your views here.

def index(request):
    """app_sandbox index view"""
    context = {}
    return render(request, "app_sandbox/index.html", context)
