# ABOUTME: Views for the op (Order of Precedence) app.
# ABOUTME: Handles public browsing and authenticated management of OP data.

from django.shortcuts import render


def index(request):
    return render(request, "op/index.html")
