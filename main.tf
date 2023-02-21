resource "random_id" "name_suffix" {
  byte_length = length(var.name) < 6 ? 6 - length(var.name) : 1
}

resource "google_service_account" "service_account" {
  project = var.project_id

  # Must be <30 chars
  account_id = substr((length(var.name) > 6 ? var.name : "${var.name}-${random_id.name_suffix.hex}"), 0, 30)

  display_name = var.name

  description = var.description
}

resource "google_project_iam_member" "project_iam_member" {
  for_each = var.roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_iam_member" "workload_identity" {
  # TODO: this results in a google_service_account_iam_member.workload_identity[0] - bit ugly
  count = var.workload_identity != null ? 1 : 0

  service_account_id = google_service_account.service_account.id

  role = "roles/iam.workloadIdentityUser"

  member = "serviceAccount:${var.project_id}.svc.id.goog[${var.workload_identity.namespace}/${var.workload_identity.name}]"
}
