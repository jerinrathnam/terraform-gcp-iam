
# IAM User Management
resource "google_project_iam_binding" "read_only" {
  for_each = length(var.read_only_users) > 0 ? toset(local.read_only_roles) : []

  project = var.project_id
  role    = "roles/${each.value}"

  members = formatlist("user:%s", var.read_only_users)
}

resource "google_project_iam_binding" "write_access" {
  for_each = length(var.write_access_users) > 0 ? toset(local.write_access_roles) : []

  project = var.project_id
  role    = "roles/${each.value}"

  members = formatlist("user:%s", var.write_access_users)
}

locals {
  write_access_roles = [
    "container.admin",
    "container.clusterAdmin",
    "iam.serviceAccountUser",
    "container.defaultNodeServiceAccount",
    "container.developer",
    "container.hostServiceAgentUser",
    "compute.networkAdmin",
    "compute.instanceAdmin.v1",
    "compute.loadBalancerAdmin",
    "compute.admin",
    "cloudbuild.builds.editor",
    "cloudbuild.builds.approver",
    "cloudbuild.builds.builder",
    "cloudbuild.integrations.owner",
    "cloudbuild.connectionViewer",
    "cloudbuild.connectionAdmin",
    "cloudbuild.readTokenAccessor",
    "cloudbuild.tokenAccessor",
    "cloudbuild.workerPoolOwner",
    "cloudbuild.workerPoolUser",
    "cloudsql.editor",
    "cloudsql.viewer",
    "cloudsql.client",
    "cloudsql.instanceUser",
    "artifactregistry.admin",
    "secretmanager.admin",
    "monitoring.admin"
  ]
  read_only_roles = [
    "container.viewer",
    "container.clusterViewer",
    "compute.networkViewer",
    "compute.loadBalancerAdmin",
    "compute.viewer",
    "cloudbuild.builds.viewer",
    "cloudbuild.integrations.viewer",
    "cloudbuild.connectionViewer",
    "cloudbuild.connectionAdmin",
    "cloudbuild.readTokenAccessor",
    "cloudbuild.tokenAccessor",
    "cloudbuild.workerPoolViewer",
    "cloudsql.viewer",
    "cloudsql.client",
    "cloudsql.instanceUser",
    "artifactregistry.reader",
    "secretmanager.secretAccessor",
    "secretmanager.viewer",
    "monitoring.viewer"
  ]
}