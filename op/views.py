# ABOUTME: Views for the op (Order of Precedence) app.
# ABOUTME: Handles public browsing and authenticated management of OP data.

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.db.models import Count, Q
from django.shortcuts import render
from django.urls import reverse, reverse_lazy
from django.views.generic import CreateView, DetailView, ListView, UpdateView

from django.http import HttpResponse

from django.shortcuts import redirect

from op.forms import (
    AlternateNameFormSet,
    BatchBestovalFormSet,
    BatchBestovalHeaderForm,
    BatchBestovalRowForm,
    BestovalForm,
    EventForm,
    HonorForm,
    QuickRecipientForm,
    RecommendationForm,
    RecommendationStatusForm,
    RecipientForm,
    ReportForm,
    ReportStatusForm,
)
from op.models import AlternateName, Bestowal, Event, Honor, Recipient, Recommendation, Report


def index(request):
    recent_bestowals = (
        Bestowal.objects.filter(is_draft=False)
        .select_related("recipient", "honor")
        .order_by("-sort_date", "-sequence")[:10]
    )
    return render(request, "op/index.html", {"recent_bestowals": recent_bestowals})


class RecipientListView(ListView):
    model = Recipient
    template_name = "op/recipient_list.html"
    context_object_name = "recipients"
    paginate_by = 25

    def get_queryset(self):
        qs = super().get_queryset()
        q = self.request.GET.get("q", "").strip()
        if q:
            qs = qs.filter(
                Q(sca_name__icontains=q)
                | Q(mundane_name__icontains=q)
                | Q(alternate_names__name__icontains=q)
            ).distinct()
        return qs

    def get_template_names(self):
        if self.request.headers.get("HX-Request"):
            return ["op/recipient_list_partial.html"]
        return [self.template_name]


class RecipientDetailView(DetailView):
    model = Recipient
    template_name = "op/recipient_detail.html"
    context_object_name = "recipient"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["bestowals"] = (
            self.object.bestowals.filter(is_draft=False)
            .select_related("honor", "event")
            .order_by("sort_date", "sequence")
        )
        context["alternate_names"] = self.object.alternate_names.all()
        return context


class HonorListView(ListView):
    model = Honor
    template_name = "op/honor_list.html"
    context_object_name = "honors"

    def get_queryset(self):
        return Honor.objects.annotate(
            recipient_count=Count("bestowals", filter=Q(bestowals__is_draft=False))
        )

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        honors = context["honors"]
        context["baronial_honors"] = [h for h in honors if h.category == Honor.Category.BARONIAL]
        context["champion_honors"] = [h for h in honors if h.category == Honor.Category.CHAMPION]
        context["external_honors"] = [h for h in honors if h.category == Honor.Category.EXTERNAL]
        return context


class HonorDetailView(DetailView):
    model = Honor
    template_name = "op/honor_detail.html"
    context_object_name = "honor"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["bestowals"] = (
            self.object.bestowals.filter(is_draft=False)
            .select_related("recipient")
            .order_by("sort_date", "sequence")
        )
        return context


class EventListView(ListView):
    model = Event
    template_name = "op/event_list.html"
    context_object_name = "events"
    paginate_by = 50


class EventDetailView(DetailView):
    model = Event
    template_name = "op/event_detail.html"
    context_object_name = "event"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["bestowals"] = (
            self.object.bestowals.filter(is_draft=False)
            .select_related("recipient", "honor")
            .order_by("sort_date", "sequence")
        )
        return context


# --- Authenticated CRUD views ---


class EventCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Event
    form_class = EventForm
    template_name = "op/event_form.html"
    success_url = reverse_lazy("op:event_list")
    success_message = "Event created successfully."


class EventUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Event
    form_class = EventForm
    template_name = "op/event_form.html"
    success_message = "Event updated successfully."

    def get_success_url(self):
        return reverse("op:event_detail", args=[self.object.pk])


class RecipientCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Recipient
    form_class = RecipientForm
    template_name = "op/recipient_form.html"
    success_message = "Recipient created successfully."

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.POST:
            context["altname_formset"] = AlternateNameFormSet(
                self.request.POST, prefix="alternate_names"
            )
        else:
            context["altname_formset"] = AlternateNameFormSet(
                prefix="alternate_names"
            )
        return context

    def form_valid(self, form):
        context = self.get_context_data()
        formset = context["altname_formset"]
        if formset.is_valid():
            self.object = form.save()
            formset.instance = self.object
            formset.save()
            messages.success(self.request, self.success_message)
            return super(CreateView, self).form_valid(form)
        return self.form_invalid(form)

    def get_success_url(self):
        return reverse("op:recipient_detail", args=[self.object.pk])


class RecipientUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Recipient
    form_class = RecipientForm
    template_name = "op/recipient_form.html"
    success_message = "Recipient updated successfully."

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.POST:
            context["altname_formset"] = AlternateNameFormSet(
                self.request.POST, instance=self.object, prefix="alternate_names"
            )
        else:
            context["altname_formset"] = AlternateNameFormSet(
                instance=self.object, prefix="alternate_names"
            )
        return context

    def form_valid(self, form):
        context = self.get_context_data()
        formset = context["altname_formset"]
        if formset.is_valid():
            self.object = form.save()
            formset.instance = self.object
            formset.save()
            messages.success(self.request, self.success_message)
            return super(UpdateView, self).form_valid(form)
        return self.form_invalid(form)

    def get_success_url(self):
        return reverse("op:recipient_detail", args=[self.object.pk])


@login_required
def recipient_duplicate_check(request):
    """HTMX endpoint: returns partial with similar existing recipients."""
    from difflib import SequenceMatcher

    q = request.GET.get("sca_name", "").strip()
    if len(q) < 3:
        return render(request, "op/partials/duplicate_warning.html", {"matches": []})

    candidates = Recipient.objects.all()
    matches = []
    for r in candidates:
        ratio = SequenceMatcher(None, q.lower(), r.sca_name.lower()).ratio()
        if ratio > 0.6:
            matches.append(r)

    # Also check alternate names
    alt_matches = list(
        AlternateName.objects.filter(name__icontains=q)
        .select_related("recipient")
        .values_list("recipient__sca_name", flat=True)
        .distinct()[:5]
    )

    return render(
        request,
        "op/partials/duplicate_warning.html",
        {"matches": matches, "alt_matches": alt_matches},
    )


class StaffRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    """Mixin that requires the user to be staff."""

    def test_func(self):
        return self.request.user.is_staff


class HonorCreateView(StaffRequiredMixin, SuccessMessageMixin, CreateView):
    model = Honor
    form_class = HonorForm
    template_name = "op/honor_form.html"
    success_url = reverse_lazy("op:honor_list")
    success_message = "Honor created successfully."


class HonorUpdateView(StaffRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Honor
    form_class = HonorForm
    template_name = "op/honor_form.html"
    success_message = "Honor updated successfully."

    def get_success_url(self):
        return reverse("op:honor_detail", args=[self.object.pk])


class BestovalCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Bestowal
    form_class = BestovalForm
    template_name = "op/bestowal_form.html"
    success_message = "Bestowal created successfully."

    def get_initial(self):
        initial = super().get_initial()
        if "recipient" in self.request.GET:
            initial["recipient"] = self.request.GET["recipient"]
        if "event" in self.request.GET:
            initial["event"] = self.request.GET["event"]
        return initial

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Pre-populate recipient display name for the autocomplete field
        recipient_pk = self.request.GET.get("recipient") or self.request.POST.get(
            "recipient"
        )
        if recipient_pk:
            try:
                context["prefilled_recipient"] = Recipient.objects.get(pk=recipient_pk)
            except Recipient.DoesNotExist:
                pass
        return context

    def get_success_url(self):
        return reverse("op:recipient_detail", args=[self.object.recipient.pk])


class BestovalUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Bestowal
    form_class = BestovalForm
    template_name = "op/bestowal_form.html"
    success_message = "Bestowal updated successfully."

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["prefilled_recipient"] = self.object.recipient
        return context

    def get_success_url(self):
        return reverse("op:recipient_detail", args=[self.object.recipient.pk])


@login_required
def recipient_autocomplete(request):
    """HTMX endpoint returning recipient search results for autocomplete."""
    q = request.GET.get("q", "").strip()
    if len(q) < 2:
        return HttpResponse("")

    results = (
        Recipient.objects.filter(
            Q(sca_name__icontains=q)
            | Q(mundane_name__icontains=q)
            | Q(alternate_names__name__icontains=q)
        )
        .distinct()
        .select_related("group")[:10]
    )
    return render(
        request,
        "op/partials/recipient_autocomplete.html",
        {"results": results},
    )


@login_required
def recipient_quick_create(request):
    """HTMX endpoint for inline recipient creation from bestowal form."""
    if request.method == "POST":
        form = QuickRecipientForm(request.POST)
        if form.is_valid():
            recipient = form.save()
            return render(
                request,
                "op/partials/recipient_selected.html",
                {"recipient": recipient},
            )
    else:
        form = QuickRecipientForm()
    return render(
        request,
        "op/partials/quick_recipient_form.html",
        {"form": form},
    )


@login_required
def batch_bestowal(request):
    """Record Court: create multiple bestowals for a single event/date."""
    if request.method == "POST":
        header_form = BatchBestovalHeaderForm(request.POST)
        formset = BatchBestovalFormSet(request.POST)
        if header_form.is_valid() and formset.is_valid():
            event = header_form.cleaned_data["event"]
            date = header_form.cleaned_data["date"]
            if not event and header_form.cleaned_data["new_event_name"]:
                event = Event.objects.create(
                    name=header_form.cleaned_data["new_event_name"],
                    date=date,
                )
            for i, form in enumerate(formset):
                if form.cleaned_data and form.cleaned_data.get("recipient"):
                    Bestowal.objects.create(
                        recipient=form.cleaned_data["recipient"],
                        honor=form.cleaned_data["honor"],
                        notes=form.cleaned_data.get("notes", ""),
                        sort_date=date,
                        event=event,
                        sequence=str(i),
                    )
            messages.success(request, "Bestowals recorded successfully.")
            if event:
                return redirect("op:event_detail", pk=event.pk)
            return redirect("op:index")
    else:
        header_form = BatchBestovalHeaderForm()
        formset = BatchBestovalFormSet()
    return render(
        request,
        "op/bestowal_batch.html",
        {"header_form": header_form, "formset": formset},
    )


@login_required
def batch_add_row(request):
    """HTMX endpoint: returns a new empty formset row."""
    form_index = request.GET.get("form_index", "0")
    form = BatchBestovalRowForm(prefix=f"form-{form_index}")
    return render(
        request,
        "op/partials/batch_row.html",
        {"form": form, "form_index": form_index},
    )


# --- Recommendation views ---


class RecommendationCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Recommendation
    form_class = RecommendationForm
    template_name = "op/recommendation_form.html"
    success_url = reverse_lazy("op:index")
    success_message = "Recommendation submitted successfully."

    def form_valid(self, form):
        form.instance.recommender = self.request.user
        return super().form_valid(form)


class RecommendationListView(StaffRequiredMixin, ListView):
    model = Recommendation
    template_name = "op/recommendation_list.html"
    context_object_name = "recommendations"
    paginate_by = 25

    def get_queryset(self):
        qs = super().get_queryset().select_related("honor", "recommender")
        status = self.request.GET.get("status")
        if status:
            qs = qs.filter(status=status)
        honor_pk = self.request.GET.get("honor")
        if honor_pk:
            qs = qs.filter(honor_id=honor_pk)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["status_choices"] = Recommendation.Status.choices
        return context


class RecommendationDetailView(StaffRequiredMixin, DetailView):
    model = Recommendation
    template_name = "op/recommendation_detail.html"
    context_object_name = "recommendation"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["status_form"] = RecommendationStatusForm(
            initial={
                "status": self.object.status,
                "scheduled_event": self.object.scheduled_event,
            }
        )
        return context


@login_required
def recommendation_update_status(request, pk):
    """Admin-only endpoint to update recommendation status."""
    if not request.user.is_staff:
        from django.http import HttpResponseForbidden

        return HttpResponseForbidden()

    rec = Recommendation.objects.get(pk=pk)
    if request.method == "POST":
        form = RecommendationStatusForm(request.POST)
        if form.is_valid():
            rec.status = form.cleaned_data["status"]
            if form.cleaned_data.get("scheduled_event"):
                rec.scheduled_event = form.cleaned_data["scheduled_event"]
            rec.save()
            messages.success(request, f"Recommendation status updated to {rec.status}.")
    return redirect("op:recommendation_detail", pk=pk)


# --- Report views ---


class ReportCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Report
    form_class = ReportForm
    template_name = "op/report_form.html"
    success_url = reverse_lazy("op:my_reports")
    success_message = "Report submitted successfully."

    def form_valid(self, form):
        form.instance.reporter = self.request.user
        return super().form_valid(form)


class ReportListView(StaffRequiredMixin, ListView):
    model = Report
    template_name = "op/report_list.html"
    context_object_name = "reports"
    paginate_by = 25

    def get_queryset(self):
        qs = super().get_queryset().select_related("reporter")
        status = self.request.GET.get("status")
        if status:
            qs = qs.filter(status=status)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["status_choices"] = Report.Status.choices
        return context


class ReportDetailView(StaffRequiredMixin, DetailView):
    model = Report
    template_name = "op/report_detail.html"
    context_object_name = "report"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["status_form"] = ReportStatusForm(
            initial={
                "status": self.object.status,
                "resolution": self.object.resolution,
            }
        )
        return context


@login_required
def report_update_status(request, pk):
    """Admin-only endpoint to update report status and resolution."""
    if not request.user.is_staff:
        from django.http import HttpResponseForbidden

        return HttpResponseForbidden()

    report = Report.objects.get(pk=pk)
    if request.method == "POST":
        form = ReportStatusForm(request.POST)
        if form.is_valid():
            report.status = form.cleaned_data["status"]
            report.resolution = form.cleaned_data.get("resolution", "")
            report.save()
            messages.success(request, f"Report status updated to {report.get_status_display()}.")
    return redirect("op:report_detail", pk=pk)


class MyReportsView(LoginRequiredMixin, ListView):
    model = Report
    template_name = "op/my_reports.html"
    context_object_name = "reports"
    paginate_by = 25

    def get_queryset(self):
        return Report.objects.filter(reporter=self.request.user).select_related("reporter")
