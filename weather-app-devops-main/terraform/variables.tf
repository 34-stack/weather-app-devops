variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "weather-app"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "weather-app"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "docker_image" {
  description = "Docker image"
  type        = string
  default     = "weather-app:latest"
}

variable "image_pull_policy" {
  description = "Image pull policy"
  type        = string
  default     = "IfNotPresent"
}

variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 2
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "service_type" {
  description = "Service type"
  type        = string
  default     = "NodePort"
}

variable "service_port" {
  description = "Service port"
  type        = number
  default     = 80
}

variable "node_port" {
  description = "NodePort"
  type        = number
  default     = 30008
}

variable "cpu_limit" {
  description = "CPU limit"
  type        = string
  default     = "500m"
}

variable "memory_limit" {
  description = "Memory limit"
  type        = string
  default     = "512Mi"
}

variable "cpu_request" {
  description = "CPU request"
  type        = string
  default     = "250m"
}

variable "memory_request" {
  description = "Memory request"
  type        = string
  default     = "256Mi"
}
