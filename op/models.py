# ABOUTME: Models for the op (Order of Precedence) app.
# ABOUTME: Core domain: recipients, honors, bestowals, events, groups, recommendations, site config.

from django.conf import settings
from django.db import models


class SiteConfig(models.Model):
    """Singleton site configuration replacing the legacy op_configuration key-value table."""

    group_name_short = models.CharField(max_length=120, default="Flaming Gryphon")
    group_name_long = models.CharField(
        max_length=250, default="The Barony of the Flaming Gryphon"
    )
    admin_name = models.CharField(max_length=250, blank=True)
    admin_email = models.EmailField(blank=True)
    coronet = models.CharField(
        max_length=250,
        blank=True,
        help_text="Current Baron and/or Baroness names",
    )

    class Meta:
        verbose_name = "Site Configuration"
        verbose_name_plural = "Site Configuration"

    def __str__(self):
        return f"Site Config: {self.group_name_short}"

    def save(self, *args, **kwargs):
        # Enforce singleton: always use pk=1
        self.pk = 1
        super().save(*args, **kwargs)

    @classmethod
    def load(cls):
        obj, _ = cls.objects.get_or_create(pk=1)
        return obj


class Group(models.Model):
    """A sub-group within the barony (marche, college, etc.)."""

    name = models.CharField(max_length=120, unique=True)
    designator = models.CharField(
        max_length=120,
        blank=True,
        help_text='Group type prefix, e.g. "Marche of", "College of"',
    )

    class Meta:
        ordering = ["name"]

    def __str__(self):
        if self.designator:
            return f"{self.designator} {self.name}"
        return self.name


class Recipient(models.Model):
    """A person in the Order of Precedence."""

    class Gender(models.TextChoices):
        MALE = "M", "Male"
        FEMALE = "F", "Female"
        UNSPECIFIED = "", "Unspecified"

    sca_name = models.CharField(max_length=250)
    mundane_name = models.CharField(max_length=250, blank=True)
    gender = models.CharField(max_length=1, choices=Gender.choices, blank=True)
    active = models.BooleanField(default=True)
    group = models.ForeignKey(
        Group,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="recipients",
    )
    name_registered = models.BooleanField(default=False)
    device_registered = models.BooleanField(default=False)
    device_blazon = models.TextField(blank=True)

    class Meta:
        ordering = ["sca_name"]

    def __str__(self):
        return self.sca_name


class AlternateName(models.Model):
    """An alternate name (nickname, former name) for a recipient."""

    recipient = models.ForeignKey(
        Recipient, on_delete=models.CASCADE, related_name="alternate_names"
    )
    name = models.CharField(max_length=120)
    is_nickname = models.BooleanField(default=False)
    is_former_name = models.BooleanField(default=False)
    is_registered = models.BooleanField(default=False)

    class Meta:
        ordering = ["name"]

    def __str__(self):
        return f"{self.name} ({self.recipient.sca_name})"


class Honor(models.Model):
    """An award, order, or champion position that can be bestowed."""

    class Category(models.TextChoices):
        BARONIAL = "BARONIAL", "Baronial"
        CHAMPION = "CHAMPION", "Champion"
        EXTERNAL = "EXTERNAL", "External/Kingdom"

    legacy_key = models.PositiveIntegerField(
        unique=True,
        null=True,
        blank=True,
        help_text="Original honorkey from legacy database for cross-referencing",
    )
    name = models.CharField(max_length=120)
    prefix = models.CharField(
        max_length=30,
        blank=True,
        help_text='Honor type prefix, e.g. "Award of the", "Order of the"',
    )
    description = models.TextField(blank=True)
    abbreviation = models.CharField(max_length=15, blank=True)
    level = models.IntegerField(default=0)
    is_active = models.BooleanField(default=True)
    category = models.CharField(
        max_length=10,
        choices=Category.choices,
        default=Category.BARONIAL,
    )
    accepts_recommendations = models.BooleanField(default=False)
    is_external = models.BooleanField(default=False)

    class Meta:
        ordering = ["-level", "name"]

    def __str__(self):
        if self.prefix:
            return f"{self.prefix} {self.name}"
        return self.name


class HonorImage(models.Model):
    """A badge/image associated with an honor."""

    honor = models.ForeignKey(Honor, on_delete=models.CASCADE, related_name="images")
    image = models.ImageField(upload_to="badges/")

    def __str__(self):
        return f"Image for {self.honor.name}"


class Event(models.Model):
    """A calendar event where bestowals can take place."""

    name = models.CharField(max_length=120)
    date = models.DateField()

    class Meta:
        ordering = ["-date"]

    def __str__(self):
        return f"{self.name} ({self.date})"


class Bestowal(models.Model):
    """A specific honor granted to a recipient, possibly at an event."""

    sort_date = models.DateField(null=True, blank=True)
    display_date = models.CharField(
        max_length=13,
        blank=True,
        help_text='Display string for uncertain dates, e.g. "2/?/84"',
    )
    sequence = models.CharField(
        max_length=5,
        blank=True,
        help_text="Ordering within a date for multiple bestowals",
    )
    event_name = models.CharField(
        max_length=50,
        blank=True,
        help_text="Legacy free-text event name from old system",
    )
    event = models.ForeignKey(
        Event,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="bestowals",
    )
    recipient = models.ForeignKey(
        Recipient, on_delete=models.CASCADE, related_name="bestowals"
    )
    honor = models.ForeignKey(
        Honor, on_delete=models.CASCADE, related_name="bestowals"
    )
    notes = models.CharField(max_length=255, blank=True)
    is_draft = models.BooleanField(default=False)

    class Meta:
        ordering = ["sort_date", "sequence"]

    def __str__(self):
        return f"{self.recipient.sca_name} — {self.honor} ({self.sort_date})"


class Recommendation(models.Model):
    """An award recommendation submitted by a logged-in user."""

    class Status(models.TextChoices):
        PENDING = "PENDING", "Pending"
        SCHEDULED = "SCHEDULED", "Scheduled"
        GIVEN = "GIVEN", "Given"
        DECLINED = "DECLINED", "Declined"

    recommender = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="recommendations",
    )
    nominee_sca_name = models.CharField(max_length=250)
    nominee_mundane_name = models.CharField(max_length=250, blank=True)
    nominee_group = models.ForeignKey(
        Group,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="recommendations",
    )
    nominee_gender = models.CharField(max_length=1, blank=True)
    nominee_is_minor = models.BooleanField(default=False)
    honor = models.ForeignKey(
        Honor,
        on_delete=models.CASCADE,
        related_name="recommendations",
    )
    justification = models.TextField()
    submitted_date = models.DateField(auto_now_add=True)
    status = models.CharField(
        max_length=10,
        choices=Status.choices,
        default=Status.PENDING,
    )
    scheduled_event = models.ForeignKey(
        Event,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="scheduled_recommendations",
    )
    # Legacy import fields — only populated for imported historical data
    legacy_recommender_sca_name = models.CharField(max_length=250, blank=True)
    legacy_recommender_mundane_name = models.CharField(max_length=250, blank=True)
    legacy_recommender_email = models.CharField(max_length=250, blank=True)
    legacy_recommender_title = models.CharField(max_length=250, blank=True)

    class Meta:
        ordering = ["-submitted_date"]

    def __str__(self):
        return f"{self.nominee_sca_name} for {self.honor} ({self.status})"


class Report(models.Model):
    """An error/correction report for OP data."""

    class Status(models.TextChoices):
        NEW = "NEW", "New"
        OPEN = "OPEN", "Open"
        PENDING = "PENDING", "Pending"
        RESOLVED = "RESOLVED", "Resolved"
        CLOSED_NO_RESOLUTION = "CLOSED_NO_RESOLUTION", "Closed (no resolution)"

    reporter = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="reports",
    )
    subject = models.CharField(max_length=255)
    description = models.TextField()
    resolution = models.TextField(blank=True)
    status = models.CharField(
        max_length=25,
        choices=Status.choices,
        default=Status.NEW,
    )
    created_date = models.DateField(auto_now_add=True)
    last_updated = models.DateField(auto_now=True)
    notify_reporter = models.BooleanField(default=True)
    # Legacy import fields — only populated for imported historical data
    legacy_reporter_sca_name = models.CharField(max_length=250, blank=True)
    legacy_reporter_email = models.CharField(max_length=250, blank=True)

    class Meta:
        ordering = ["-created_date"]

    def __str__(self):
        return f"{self.subject} ({self.status})"
