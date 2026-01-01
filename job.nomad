job "nginx-nomatron-job" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 1

    network {
      port "http" {
        to   = 80
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:alpine"
        ports = ["http"]
      }

      resources {
        cpu    = 2
        memory =16
      }
    }
  }
}