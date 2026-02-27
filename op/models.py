# ABOUTME: Models for the op (Order of Precedence) app.
# ABOUTME: SiteConfig holds group-wide settings replacing the legacy key-value table.

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
