

output "cluster_id" {
  description = "ID of the Alloy DB Cluster created"
  value       = google_alloydb_cluster.default.id
}

output "primary_instance_id" {
  description = "ID of the primary instance created"
  value       = google_alloydb_instance.primary.id
}

output "primary_psc_attachment_link" {
  description = "The private service connect (psc) attachment created for primary instance"
  value       = try(google_alloydb_instance.primary.psc_instance_config[0].service_attachment_link, "")
}

output "primary_psc_dns_name" {
  description = "The DNS name of the instance for PSC connectivity created for primary instance"
  value       = try(google_alloydb_instance.primary.psc_instance_config[0].psc_dns_name, "")
}

# output "read_instance_ids" {
#   description = "IDs of the read instances created"
#   value = [
#     for rd, details in google_alloydb_instance.read_pool : details.id
#   ]
# }

# output "read_psc_attachment_links" {
#   description = "The private service connect (psc) attachment created read replica instances"
#   value = try([
#     for rd, details in google_alloydb_instance.read_pool : details.psc_instance_config[0].service_attachment_link
#   ], "")
# }

# output "read_psc_dns_names" {
#   description = "The DNS names of the instances for PSC connectivity created for replica instances"
#   value = try([
#     for rd, details in google_alloydb_instance.read_pool : details.psc_instance_config[0].psc_dns_name
#   ], "")
# }

output "cluster_name" {
  description = "ID of the Alloy DB Cluster created"
  value       = google_alloydb_cluster.default.name
}

output "cluster" {
  description = "Cluster created"
  value       = resource.google_alloydb_cluster.default
}

output "primary_instance" {
  description = "Primary instance created"
  value       = resource.google_alloydb_instance.primary
}

# output "replica_instances" {
#   description = "Replica instances created"
#   value       = resource.google_alloydb_instance.read_pool
# }

output "primary_instance_ip" {
  description = "The IP address of the primary AlloyDB instance"
  value       = google_alloydb_instance.primary.ip_address
}

output "env_vars" {
  description = "Exported environment variables"
  value = {
    "ALLOYDB_INSTANCE_HOST" : google_alloydb_instance.primary.ip_address
  }
}