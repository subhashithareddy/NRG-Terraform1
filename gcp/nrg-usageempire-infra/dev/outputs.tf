

# output "project_id" {
#   description = "Project ID of the Alloy DB Cluster created"
#   value       = var.project_id
# }

# output "cluster_central" {
#   description = "cluster"
#   value       = module.nrg_usage_empire_alloy_db.cluster
# }

# output "primary_instance_central" {
#   description = "primary instance created"
#   value       = module.nrg_usage_empire_alloy_db.primary_instance
# }

# output "cluster_id_central" {
#   description = "ID of the Alloy DB Cluster created"
#   value       = module.nrg_usage_empire_alloy_db.cluster_id
# }

# output "primary_instance_id_central" {
#   description = "ID of the primary instance created"
#   value       = module.nrg_usage_empire_alloy_db.primary_instance_id
# }

# # output "read_instance_ids_central" {
# #   description = "IDs of the read instances created"
# #   value       = module.nrg_usage_empire_alloy_db.read_instance_ids
# # }

# output "cluster_name_central" {
#   description = "The name of the cluster resource"
#   value       = module.nrg_usage_empire_alloy_db.cluster_name
# }

# output "primary_psc_attachment_link_central" {
#   description = "The private service connect (psc) attachment created for primary instance"
#   value       = module.nrg_usage_empire_alloy_db.primary_psc_attachment_link
# }

# output "psc_dns_name_central" {
#   description = "he DNS name of the instance for PSC connectivity. Name convention: ...alloydb-psc.goog"
#   value       = module.nrg_usage_empire_alloy_db.primary_instance.psc_instance_config[0].psc_dns_name
# }

# # output "read_psc_attachment_links_central" {
# #   value = module.nrg_usage_empire_alloy_db.read_psc_attachment_links
# # }

# # output "cluster_east" {
# #   description = "cluster created"
# #   value       = module.alloydb_east.cluster
# # }

# # output "primary_instance_east" {
# #   description = "primary instance created"
# #   value       = module.alloydb_east.primary_instance
# # }

# # output "cluster_id_east" {
# #   description = "ID of the Alloy DB Cluster created"
# #   value       = module.alloydb_east.cluster_id
# # }

# # output "kms_key_name_central" {
# #   description = "he fully-qualified resource name of the KMS key"
# #   value       = google_kms_crypto_key.key_region_central.id
# # }


# # output "kms_key_name_east" {
# #   description = "he fully-qualified resource name of the Secondary clusterKMS key"
# #   value       = google_kms_crypto_key.key_region_east.id
# # }

# # output "psc_consumer_fwd_rule_ip" {
# #   description = "Consumer psc endpoint created"
# #   value       = google_compute_address.psc_consumer_address.address
# # }

# output "region_central" {
#   description = "The region for primary cluster"
#   value       = var.region_central
# }

# # output "region_east" {
# #   description = "The region for cross region replica secondary cluster"
# #   value       = var.region_east
# # }

# # output "psc_attachment" {
# #   value       = google_compute_network_attachment.psc_attachment
# #   description = "The network attachment resource created in the consumer project to which the PSC interface will be linked"
# # }



output "project_id" {
  description = "Project ID of the Alloy DB Cluster created"
  value       = var.project_id
}

# output "cluster" {
#   description = "Primary cluster name"
#   value       = module.nrg_usage_empire_alloy_db.cluster
# }

output "cluster_id" {
  description = "ID of the Alloy DB Cluster created"
  value       = module.nrg_usage_empire_alloy_db.cluster_id
}

output "cluster_name" {
  description = "The name of the cluster resource"
  value       = module.nrg_usage_empire_alloy_db.cluster_name
}

output "primary_instance_id" {
  description = "ID of the primary instance created"
  value       = module.nrg_usage_empire_alloy_db.primary_instance_id
}

# output "primary_instance_name" {
#   description = "primary instance name"
#   value       = module.nrg_usage_empire_alloy_db.primary_instance_name
# }


output "primary_psc_attachment_link" {
  description = "The private service connect (psc) attachment created for primary instance"
  value       = module.nrg_usage_empire_alloy_db.primary_psc_attachment_link
}

output "primary_psc_dns_name" {
  description = "The DNS name of the instance for PSC connectivity created for primary instance"
  value       = module.nrg_usage_empire_alloy_db.primary_psc_dns_name
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

# output "cluster_name" {
#   description = "ID of the Alloy DB Cluster created"
#   value       = google_alloydb_cluster.default.name
# }

# output "cluster" {
#   description = "Cluster created"
#   value       = resource.google_alloydb_cluster.default
# }

# output "primary_instance" {
#   description = "Primary instance created"
#   value       = resource.google_alloydb_instance.primary
# }

# output "replica_instances" {
#   description = "Replica instances created"
#   value       = resource.google_alloydb_instance.read_pool
# }

# output "primary_instance_ip" {
#   description = "The IP address of the primary AlloyDB instance"
#   value       = google_alloydb_instance.primary.ip_address
# }

# output "read_instance_ips" {
#   description = "Replica IPs"
#   value = [
#     for rd, details in google_alloydb_instance.read_pool : details.ip_address
#   ]
# }

# output "env_vars" {
#   description = "Exported environment variables"
#   value = {
#     "ALLOYDB_INSTANCE_HOST" : google_alloydb_instance.primary.ip_address,
#     "ALLOYDB_READ_REPLICAS" : jsonencode([for rd, details in google_alloydb_instance.read_pool : details.ip_address])
#   }
# }