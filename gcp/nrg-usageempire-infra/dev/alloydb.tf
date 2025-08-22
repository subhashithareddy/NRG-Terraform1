
module "nrg_usage_empire_alloy_db" {
  source                           = "../../modules/alloy-db"
  env                              = var.env

  cluster_id                       = var.nrg_usage_empire_cluster_id
  location                         = var.nrg_usage_empire_cluster_location
  project_id                       = var.project_id
  cluster_labels                   = var.nrg_usage_empire_cluster_labels
  database_version                 = var.database_version

  psc_enabled                      = var.psc_enabled
  # psc_allowed_consumer_projects    = [var.attachment_project_number]



  continuous_backup_recovery_window_days  = var.continuous_backup_recovery_window_days
  continuous_backup_encryption_key_name   = var.continuous_backup_encryption_key_name


  cluster_initial_user = {
    user     = var.cluster_initial_user.user
    password = var.cluster_initial_user.password
  }
   
   
   # This value we got from consumer project's private service connect/network attcahemnts. Network attachment is created using "google_compute_network_attachment" resource
   # we set this value if we need outbound psc connectivity from ALLOY DB Instance
   # network_attachment_resource = google_compute_network_attachment.psc_attachment.id
  #  network_attachment_resource = "projects/consumer-project-463506/regions/us-central1/networkAttachments/psc-network-attachment"


  primary_instance = var.primary_instance

  read_pool_instance = var.read_pool_instance
  

  # depends_on = [google_compute_network.default, google_compute_global_address.private_ip_alloc, google_service_networking_connection.vpc_connection]

}










