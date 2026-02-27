# ABOUTME: Views for the op (Order of Precedence) app.
# ABOUTME: Handles public browsing and authenticated management of OP data.

from django.db.models import Q
from django.shortcuts import render
from django.views.generic import DetailView, ListView

from op.models import Bestowal, Recipient


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
