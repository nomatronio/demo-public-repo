job "nginx-nomatron-job" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 1

    network {
      port "http" {
        static   = NOMATRON_VAR_app_port
      }
    }

    task "nginx" {
      driver = "docker"


      config {
        image = "${NOMATRON_VAR_app_image}"
        ports = ["http"]
      }

      resources {
        cpu    = 2
        memory =16
      }
    }
  }
}