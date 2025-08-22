###############  Cluster Variables  ################## 

variable "env" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "non-prod", "prod"], var.env)
    error_message = "Environment must be either 'dev' or 'qa' or 'non-prod' or 'prod'."
  }
}

variable "region" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "nrg_usage_empire_cluster_id" {
  description = "The ID of the alloydb cluster"
  type        = string
}

variable "nrg_usage_empire_cluster_location" {
  description = "Location where AlloyDb cluster will be deployed"
  type        = string
  default     = "us-central1"
}

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "nrg_usage_empire_cluster_labels" {
  description = "User-defined labels for the alloydb cluster"
  type        = map(string) 
}

variable "cluster_type" {
  description = "The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY"
  type        = string
  default     = "PRIMARY"
}

variable "database_version" {
  type        = string
  description = "The database engine major version. This is an optional field and it's populated at the Cluster creation time. This field cannot be changed after cluster creation. Possible valus: POSTGRES_14, POSTGRES_15"
  default     = null
}

variable "skip_await_major_version_upgrade" {
  description = "Set to true to skip awaiting on the major version upgrade of the cluster. Possible values: true, false. Default value: true"
  type        = bool
  default     = false
}

variable "psc_enabled" {
  type        = bool
  description = "Create an instance that allows connections from Private Service Connect endpoints to the instance. If psc_enabled is set to true, then network_self_link should be set to null, and you must create additional network resources detailed under `examples/example_with_private_service_connect`"
  default     = true
}

variable "psc_allowed_consumer_projects" {
  type        = list(string)
  description = "List of consumer projects that are allowed to create PSC endpoints to service-attachments to this instance. These should be specified as project numbers only."
  default     = []
}

variable "continuous_backup_recovery_window_days" {
  type        = number
  description = "The numbers of days that are eligible to restore from using PITR (point-in-time-recovery). Defaults to 14 days. The value must be between 1 and 35"
  default     = 14
}

variable "continuous_backup_encryption_key_name" {
  type        = string
  description = "The fully-qualified resource name of the KMS key. Cloud KMS key should be in same region as Cluster and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]"
  default     = null
}



variable "primary_instance" {
  description = "Primary cluster configuration that supports read and write operations."
  type = object({
    instance_id        = string,
    display_name       = optional(string),
    database_flags     = optional(map(string))
    labels             = optional(map(string))
    annotations        = optional(map(string))
    gce_zone           = optional(string)
    availability_type  = optional(string)
    machine_cpu_count  = optional(number, 2)
    machine_type       = optional(string)
    ssl_mode           = optional(string)
    require_connectors = optional(bool)
    query_insights_config = optional(object({
      query_string_length     = optional(number)
      record_application_tags = optional(bool)
      record_client_address   = optional(bool)
      query_plans_per_minute  = optional(number)
    }))
    enable_public_ip          = optional(bool, false)
    enable_outbound_public_ip = optional(bool, false)
    cidr_range                = optional(list(string))
  })
  nullable = false
  validation {
    condition     = contains([1, 2, 4, 8, 16, 32, 64, 96, 128], var.primary_instance.machine_cpu_count)
    error_message = "machine_cpu_count must be one of [1, 2, 4, 8, 16, 32, 64, 96, 128]"
  }
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$", var.primary_instance.instance_id))
    error_message = "Primary Instance ID should satisfy the following pattern ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$"
  }
  validation {
    condition = var.primary_instance.query_insights_config == null || (
      try(var.primary_instance.query_insights_config.query_string_length, 0) >= 256 &&
      try(var.primary_instance.query_insights_config.query_string_length, 0) <= 4500
    )
    error_message = "Query string length must be between 256 and 4500. The default value is 1024."
  }
  validation {
    condition = var.primary_instance.query_insights_config == null || (
      try(var.primary_instance.query_insights_config.query_plans_per_minute, 0) >= 0 &&
      try(var.primary_instance.query_insights_config.query_plans_per_minute, 0) <= 20
    )
    error_message = "Query plans per minute must be between 0 and 20. The default value is 5."
  }
}



variable "read_pool_instance" {
  description = "List of Read Pool Instances to be created"
  type = list(object({
    instance_id        = string
    display_name       = string
    node_count         = optional(number, 1)
    database_flags     = optional(map(string))
    machine_cpu_count  = optional(number, 2)
    machine_type       = optional(string)
    ssl_mode           = optional(string)
    require_connectors = optional(bool)
    query_insights_config = optional(object({
      query_string_length     = optional(number)
      record_application_tags = optional(bool)
      record_client_address   = optional(bool)
      query_plans_per_minute  = optional(number)
    }))
    enable_public_ip = optional(bool, false)
    cidr_range       = optional(list(string))
  }))
  nullable = false
  default  = []
  validation {
    condition     = alltrue([for rp in var.read_pool_instance : contains([1, 2, 4, 8, 16, 32, 64, 96, 128], rp.machine_cpu_count)])
    error_message = "machine_cpu_count must be one of [1, 2, 4, 8, 16, 32, 64, 96, 128]"
  }
}

# # ###############  PSC Consumer project related variables  ################## 
# variable "attachment_project_number" {
#   description = "The project number in which attachment will be provisioned"
#   type        = string
# }

# variable "attachment_project_id" {
#   description = "The ID of the project in which attachment will be provisioned"
#   type        = string
#   # default     = "consumer-project-463506"
# }







variable "cluster_initial_user" {
  description = "Alloy DB Cluster Initial User Credentials"
  type = object({
    user     = optional(string),
    password = string
  })
}