# ABOUTME: Forms for the op app CRUD views.
# ABOUTME: ModelForms for Recipient, Honor, Event, Bestowal, and inline formsets.

from django import forms
from django.forms import formset_factory, inlineformset_factory

from op.models import AlternateName, Bestowal, Event, Honor, Recipient, Recommendation, Report


class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ["name", "date"]
        widgets = {
            "date": forms.DateInput(attrs={"type": "date"}),
        }


class RecipientForm(forms.ModelForm):
    class Meta:
        model = Recipient
        fields = [
            "sca_name",
            "mundane_name",
            "gender",
            "group",
            "active",
            "name_registered",
            "device_registered",
            "device_blazon",
        ]


AlternateNameFormSet = inlineformset_factory(
    Recipient,
    AlternateName,
    fields=["name", "is_nickname", "is_former_name", "is_registered"],
    extra=1,
    can_delete=True,
)


class HonorForm(forms.ModelForm):
    class Meta:
        model = Honor
        fields = [
            "name",
            "prefix",
            "description",
            "abbreviation",
            "level",
            "is_active",
            "category",
            "accepts_recommendations",
        ]


class BestovalForm(forms.ModelForm):
    class Meta:
        model = Bestowal
        fields = [
            "recipient",
            "honor",
            "sort_date",
            "display_date",
            "event",
            "event_name",
            "notes",
        ]
        widgets = {
            "sort_date": forms.DateInput(attrs={"type": "date"}),
        }


class QuickRecipientForm(forms.ModelForm):
    """Minimal form for creating a recipient inline from the bestowal form."""

    class Meta:
        model = Recipient
        fields = ["sca_name", "mundane_name"]


class BatchBestovalHeaderForm(forms.Form):
    """Shared event and date fields for batch bestowal entry."""

    event = forms.ModelChoiceField(
        queryset=Event.objects.all(),
        required=False,
        help_text="Select an existing event, or enter a new event name below.",
    )
    new_event_name = forms.CharField(
        required=False,
        max_length=120,
        help_text="Create a new event with this name (leave blank to use existing).",
    )
    date = forms.DateField(widget=forms.DateInput(attrs={"type": "date"}))


class BatchBestovalRowForm(forms.Form):
    """A single row in the batch bestowal formset."""

    recipient = forms.ModelChoiceField(
        queryset=Recipient.objects.all(),
        required=False,
    )
    honor = forms.ModelChoiceField(
        queryset=Honor.objects.filter(is_active=True),
        required=False,
    )
    notes = forms.CharField(required=False, max_length=255)


BatchBestovalFormSet = formset_factory(BatchBestovalRowForm, extra=5)


class RecommendationForm(forms.ModelForm):
    """Form for submitting an award recommendation."""

    class Meta:
        model = Recommendation
        fields = [
            "nominee_sca_name",
            "nominee_mundane_name",
            "nominee_group",
            "nominee_gender",
            "nominee_is_minor",
            "honor",
            "justification",
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Only show honors that accept recommendations
        self.fields["honor"].queryset = Honor.objects.filter(
            accepts_recommendations=True, is_active=True
        )


class RecommendationStatusForm(forms.Form):
    """Form for admin to update recommendation status."""

    status = forms.ChoiceField(choices=Recommendation.Status.choices)
    scheduled_event = forms.ModelChoiceField(
        queryset=Event.objects.all(),
        required=False,
    )


class ReportForm(forms.ModelForm):
    """Form for submitting an error/correction report."""

    class Meta:
        model = Report
        fields = ["subject", "description"]


class ReportStatusForm(forms.Form):
    """Form for admin to update report status and resolution."""

    status = forms.ChoiceField(choices=Report.Status.choices)
    resolution = forms.CharField(widget=forms.Textarea, required=False)
