variable "user_name" {
  description = "The user name to use"
  type        = list(string)
}

variable "create_inline_policy" {
  description = "Whether or not to create an inline policy"
  type        = bool
  default     = false
}

variable "inline_policy" {
  description = "Inline policy"
  type        = any
  default     = {}
}

variable "custom_tags" {
  description = "Custom Tags"
  type        = map(string)
  default     = {}
}
