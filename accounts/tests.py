# ABOUTME: Tests for the accounts app (registration, login, approval).
# ABOUTME: Covers custom User model, auth backend, registration flow, and admin approval.

import pytest
from django.contrib.auth import get_user_model
from django.test import Client
from django.urls import reverse

User = get_user_model()


@pytest.fixture
def client():
    return Client()


@pytest.fixture
def approved_user():
    user = User.objects.create_user(
        username="gooduser",
        password="testpass123",
        sca_name="Dafydd Blaidd",
        is_approved=True,
    )
    return user


@pytest.fixture
def unapproved_user():
    user = User.objects.create_user(
        username="pendinguser",
        password="testpass123",
        sca_name="Newbie McNew",
        is_approved=False,
    )
    return user


@pytest.fixture
def admin_user():
    user = User.objects.create_superuser(
        username="admin",
        password="adminpass123",
        sca_name="The Admin",
        is_approved=True,
    )
    return user


@pytest.mark.django_db
class TestUserModel:
    def test_create_user(self):
        user = User.objects.create_user(
            username="test",
            password="pass123",
            sca_name="Test Person",
        )
        assert user.sca_name == "Test Person"
        assert user.is_approved is False

    def test_str(self):
        user = User.objects.create_user(
            username="test",
            password="pass123",
            sca_name="Test Person",
        )
        assert "test" in str(user)


@pytest.mark.django_db
class TestAuthBackend:
    def test_approved_user_can_login(self, client, approved_user):
        result = client.login(username="gooduser", password="testpass123")
        assert result is True

    def test_unapproved_user_cannot_login(self, client, unapproved_user):
        result = client.login(username="pendinguser", password="testpass123")
        assert result is False

    def test_wrong_password_fails(self, client, approved_user):
        result = client.login(username="gooduser", password="wrongpass")
        assert result is False


@pytest.mark.django_db
class TestRegistrationView:
    def test_register_page_returns_200(self, client):
        response = client.get(reverse("accounts:register"))
        assert response.status_code == 200

    def test_register_creates_unapproved_user(self, client):
        response = client.post(
            reverse("accounts:register"),
            {
                "username": "newuser",
                "email": "new@example.com",
                "sca_name": "Sir New",
                "password1": "Str0ngP@ss!",
                "password2": "Str0ngP@ss!",
            },
        )
        assert response.status_code == 302
        user = User.objects.get(username="newuser")
        assert user.is_approved is False
        assert user.sca_name == "Sir New"

    def test_register_redirects_to_success(self, client):
        response = client.post(
            reverse("accounts:register"),
            {
                "username": "newuser",
                "email": "new@example.com",
                "sca_name": "Sir New",
                "password1": "Str0ngP@ss!",
                "password2": "Str0ngP@ss!",
            },
        )
        assert response.status_code == 302


@pytest.mark.django_db
class TestLoginView:
    def test_login_page_returns_200(self, client):
        response = client.get(reverse("accounts:login"))
        assert response.status_code == 200

    def test_approved_user_login_redirects(self, client, approved_user):
        response = client.post(
            reverse("accounts:login"),
            {"username": "gooduser", "password": "testpass123"},
        )
        assert response.status_code == 302

    def test_unapproved_user_sees_message(self, client, unapproved_user):
        response = client.post(
            reverse("accounts:login"),
            {"username": "pendinguser", "password": "testpass123"},
        )
        content = response.content.decode()
        # Should show error - not redirect
        assert response.status_code == 200


@pytest.mark.django_db
class TestNavAuthLinks:
    def test_anonymous_sees_login_link(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Login" in content or "login" in content

    def test_logged_in_sees_logout(self, client, approved_user):
        client.login(username="gooduser", password="testpass123")
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Logout" in content or "logout" in content


@pytest.mark.django_db
class TestPendingApproval:
    def test_admin_can_view_pending(self, client, admin_user, unapproved_user):
        client.login(username="admin", password="adminpass123")
        response = client.get(reverse("accounts:pending"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "pendinguser" in content

    def test_admin_can_approve_user(self, client, admin_user, unapproved_user):
        client.login(username="admin", password="adminpass123")
        response = client.post(
            reverse("accounts:approve", args=[unapproved_user.pk]),
        )
        unapproved_user.refresh_from_db()
        assert unapproved_user.is_approved is True

    def test_non_admin_cannot_view_pending(self, client, approved_user):
        client.login(username="gooduser", password="testpass123")
        response = client.get(reverse("accounts:pending"))
        assert response.status_code in (302, 403)
