# Create namespace for the weather app
resource "kubernetes_namespace" "weather_app" {
  metadata {
    name = var.namespace

    labels = {
      name        = var.namespace
      environment = var.environment
      managed-by  = "terraform"
      app         = var.app_name
    }
  }
}

# Deployment for weather app
resource "kubernetes_deployment" "weather_app" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.weather_app.metadata[0].name

    labels = {
      app         = var.app_name
      environment = var.environment
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app         = var.app_name
          environment = var.environment
        }
      }

      spec {
        container {
          name              = var.app_name
          image             = var.docker_image
          image_pull_policy = var.image_pull_policy

          port {
            container_port = var.container_port
            protocol       = "TCP"
          }

          resources {
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
            requests = {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = var.container_port
            }
            initial_delay_seconds = 10
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/"
              port = var.container_port
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }

  depends_on = [kubernetes_namespace.weather_app]
}

# Service for weather app
resource "kubernetes_service" "weather_service" {
  metadata {
    name      = "${var.app_name}-service"
    namespace = kubernetes_namespace.weather_app.metadata[0].name

    labels = {
      app = var.app_name
    }
  }

  spec {
    type = var.service_type

    selector = {
      app = var.app_name
    }

    port {
      port        = var.service_port
      target_port = var.container_port
      node_port   = var.service_type == "NodePort" ? var.node_port : null
      protocol    = "TCP"
    }
  }

  depends_on = [kubernetes_deployment.weather_app]
}
