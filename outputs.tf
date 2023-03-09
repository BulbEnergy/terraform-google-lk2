output "service_account" {
  description = "The google_service_account resource"
  value       = google_service_account.service_account
}

output "service_account_name" {
  description = "The service account name"
  value       = google_service_account.service_account.name
}

output "service_account_id" {
  description = "The service account id"
  value       = google_service_account.service_account.id
}

output "service_account_email" {
  description = "The service account email"
  value       = google_service_account.service_account.email
}

output "service_account_unique_id" {
  description = "The service account unique id"
  value       = google_service_account.service_account.unique_id
}
