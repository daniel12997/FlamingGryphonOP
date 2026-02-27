# ABOUTME: Views for the accounts app.
# ABOUTME: Registration, login, logout, and admin approval of pending users.

from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse_lazy
from django.views.generic import CreateView

from accounts.forms import RegistrationForm

User = get_user_model()


class RegisterView(CreateView):
    form_class = RegistrationForm
    template_name = "accounts/register.html"
    success_url = reverse_lazy("accounts:register_success")


def register_success(request):
    return render(request, "accounts/register_success.html")


@staff_member_required
def pending_users(request):
    users = User.objects.filter(is_approved=False, is_active=True)
    return render(request, "accounts/pending.html", {"pending_users": users})


@staff_member_required
def approve_user(request, pk):
    user = get_object_or_404(User, pk=pk)
    if request.method == "POST":
        user.is_approved = True
        user.save()
        messages.success(request, f"User {user.username} has been approved.")
    return redirect("accounts:pending")
