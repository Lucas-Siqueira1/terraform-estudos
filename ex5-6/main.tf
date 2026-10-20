terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "= 2.5.3"
    }
  }
}

module "backend" {
  source = "./modulos/servico"

  nome = "gaia-backend"
  cpu = 2
  memoria = "2Gi"
  max_instances = var.ambiente == "prod" ? 10 : 2
}

module "frontend" {
  source = "./modulos/servico"

  nome = "gaia-frontend"
  cpu = 1
  memoria = "256Mi"
  max_instances = var.ambiente == "prod" ? 10 : 2
}