terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "= 2.5.3"
    }
    random = {
        source = "hashicorp/random"
    }
  }
}

resource "local_file" "config" {
  filename = "${path.module}/${var.nome}.json"

  content = jsonencode({
    nome = var.nome
    cpu = var.cpu
    memoria = var.memoria
    max_instances = var.max_instances
  })
}

