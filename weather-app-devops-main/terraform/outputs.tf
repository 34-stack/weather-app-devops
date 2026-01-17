output "namespace" {
  description = "Kubernetes namespace"
  value       = kubernetes_namespace.weather_app.metadata[0].name
}

output "deployment_name" {
  description = "Deployment name"
  value       = kubernetes_deployment.weather_app.metadata[0].name
}

output "service_name" {
  description = "Service name"
  value       = kubernetes_service.weather_service.metadata[0].name
}

output "node_port" {
  description = "NodePort"
  value       = var.node_port
}

output "access_command" {
  description = "Command to access the app"
  value       = "minikube service ${kubernetes_service.weather_service.metadata[0].name} -n ${kubernetes_namespace.weather_app.metadata[0].name}"
}
