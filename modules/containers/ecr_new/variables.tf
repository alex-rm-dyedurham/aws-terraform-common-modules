variable "repo_names" {
  description = "List of repo names to be created. An ECR repository will be created for passed repo name."
  type        = list(string)
}

variable "repository_read_write_access_arns" {
  description = "List of arns that allow read and write access"
  type        = list(string)
}

variable "prod_nodepool_arns" {
  type        = list(string)
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  type        = string
	default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  type        = bool
	default     = true
}

variable "tags" {
  description = "Map of custom tags to apply to each ECR repo."
  type        = map(string)
  default     = {}
}
