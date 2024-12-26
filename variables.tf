variable "temp" {
  type        = string
  description = "temp var"
}

output "temp_var" {
  value = var.temp
}
