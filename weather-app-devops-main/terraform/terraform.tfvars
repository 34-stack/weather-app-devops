# Environment Configuration
environment = "dev"
namespace   = "weather-app"
app_name    = "weather-app"

# Docker Image
docker_image       = "weather-app:latest"
image_pull_policy  = "IfNotPresent"

# Application Scaling
replicas = 2

# Service Configuration
service_type = "NodePort"
service_port = 80
node_port    = 30008

# Resource Limits (for dev environment)
cpu_limit      = "500m"
memory_limit   = "512Mi"
cpu_request    = "250m"
memory_request = "256Mi"

# Additional Labels
labels = {
  team    = "devops"
  project = "weather-app"
}
