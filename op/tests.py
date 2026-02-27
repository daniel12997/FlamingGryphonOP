# ABOUTME: Tests for the op (Order of Precedence) app.
# ABOUTME: Covers models, views, and import commands.

import datetime

import pytest
from django.test import Client

from op.models import (
    AlternateName,
    Bestowal,
    Event,
    Group,
    Honor,
    HonorImage,
    Recipient,
    SiteConfig,
)


@pytest.mark.django_db
class TestIndexView:
    def test_index_returns_200(self):
        client = Client()
        response = client.get("/")
        assert response.status_code == 200

    def test_index_contains_welcome_text(self):
        client = Client()
        response = client.get("/")
        assert b"Order of Precedence" in response.content


@pytest.mark.django_db
class TestSiteConfig:
    def test_load_creates_default(self):
        config = SiteConfig.load()
        assert config.pk == 1
        assert config.group_name_short == "Flaming Gryphon"

    def test_singleton_enforced(self):
        config1 = SiteConfig(group_name_short="Test1", group_name_long="Test One")
        config1.save()
        config2 = SiteConfig(group_name_short="Test2", group_name_long="Test Two")
        config2.save()
        assert SiteConfig.objects.count() == 1
        assert SiteConfig.objects.get(pk=1).group_name_short == "Test2"

    def test_str(self):
        config = SiteConfig.load()
        assert str(config) == "Site Config: Flaming Gryphon"


@pytest.mark.django_db
class TestGroup:
    def test_create(self):
        group = Group.objects.create(name="Havenholde", designator="Marche of")
        assert str(group) == "Marche of Havenholde"

    def test_str_without_designator(self):
        group = Group.objects.create(name="Flaming Gryphon")
        assert str(group) == "Flaming Gryphon"

    def test_unique_name(self):
        Group.objects.create(name="Havenholde")
        with pytest.raises(Exception):
            Group.objects.create(name="Havenholde")


@pytest.mark.django_db
class TestRecipient:
    def test_create(self):
        r = Recipient.objects.create(sca_name="Dafydd Blaidd", mundane_name="Dave M")
        assert str(r) == "Dafydd Blaidd"
        assert r.active is True

    def test_group_optional(self):
        r = Recipient.objects.create(sca_name="No Group Person")
        assert r.group is None

    def test_group_fk(self):
        group = Group.objects.create(name="Unicorn", designator="Marche of")
        r = Recipient.objects.create(sca_name="Test Person", group=group)
        assert r.group == group


@pytest.mark.django_db
class TestAlternateName:
    def test_create_and_link(self):
        r = Recipient.objects.create(sca_name="Myles Blackheath")
        alt = AlternateName.objects.create(
            recipient=r, name="Myles Blackwolf", is_former_name=True
        )
        assert alt.recipient == r
        assert str(alt) == "Myles Blackwolf (Myles Blackheath)"
        assert r.alternate_names.count() == 1

    def test_nickname(self):
        r = Recipient.objects.create(sca_name="Papasan")
        alt = AlternateName.objects.create(
            recipient=r, name="Papa", is_nickname=True
        )
        assert alt.is_nickname is True
        assert alt.is_former_name is False


@pytest.mark.django_db
class TestHonor:
    def test_create_baronial(self):
        h = Honor.objects.create(
            name="Flaming Brand",
            prefix="Award of the",
            category=Honor.Category.BARONIAL,
            level=50,
        )
        assert str(h) == "Award of the Flaming Brand"
        assert h.is_external is False

    def test_create_champion(self):
        h = Honor.objects.create(
            name="Baronial Champion",
            category=Honor.Category.CHAMPION,
            level=0,
        )
        assert str(h) == "Baronial Champion"

    def test_create_external(self):
        h = Honor.objects.create(
            name="Award of Arms",
            category=Honor.Category.EXTERNAL,
            is_external=True,
            legacy_key=187,
        )
        assert h.is_external is True
        assert h.legacy_key == 187

    def test_str_without_prefix(self):
        h = Honor.objects.create(name="Baronial Champion")
        assert str(h) == "Baronial Champion"


@pytest.mark.django_db
class TestEvent:
    def test_create(self):
        e = Event.objects.create(
            name="Push for Pennsic", date=datetime.date(2011, 7, 9)
        )
        assert str(e) == "Push for Pennsic (2011-07-09)"


@pytest.mark.django_db
class TestBestowal:
    def test_create_with_fks(self):
        r = Recipient.objects.create(sca_name="Test Person")
        h = Honor.objects.create(name="Flaming Brand", prefix="Award of the")
        b = Bestowal.objects.create(
            recipient=r,
            honor=h,
            sort_date=datetime.date(2020, 1, 1),
        )
        assert b.recipient == r
        assert b.honor == h
        assert str(b) == "Test Person — Award of the Flaming Brand (2020-01-01)"

    def test_nullable_sort_date(self):
        r = Recipient.objects.create(sca_name="Test Person")
        h = Honor.objects.create(name="Test Honor")
        b = Bestowal.objects.create(recipient=r, honor=h, sort_date=None)
        assert b.sort_date is None

    def test_draft_default_false(self):
        r = Recipient.objects.create(sca_name="Test Person")
        h = Honor.objects.create(name="Test Honor")
        b = Bestowal.objects.create(
            recipient=r, honor=h, sort_date=datetime.date(2020, 1, 1)
        )
        assert b.is_draft is False

    def test_event_fk_optional(self):
        r = Recipient.objects.create(sca_name="Test Person")
        h = Honor.objects.create(name="Test Honor")
        b = Bestowal.objects.create(
            recipient=r,
            honor=h,
            sort_date=datetime.date(2020, 1, 1),
            event_name="Some Event",
        )
        assert b.event is None
        assert b.event_name == "Some Event"

    def test_event_fk_linked(self):
        r = Recipient.objects.create(sca_name="Test Person")
        h = Honor.objects.create(name="Test Honor")
        e = Event.objects.create(name="Twelfth Night", date=datetime.date(2020, 1, 4))
        b = Bestowal.objects.create(
            recipient=r,
            honor=h,
            sort_date=datetime.date(2020, 1, 4),
            event=e,
        )
        assert b.event == e


@pytest.mark.django_db
class TestHonorImage:
    def test_create(self):
        h = Honor.objects.create(name="Flaming Brand")
        img = HonorImage.objects.create(honor=h, image="badges/brand.gif")
        assert img.honor == h
        assert str(img) == "Image for Flaming Brand"
