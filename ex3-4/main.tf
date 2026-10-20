terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "= 2.5.3"
    }
  }
}

variable "estado" {
    type = map(object({
      sigla = string
      capital = string
    }))
}

resource "local_file" "estado" {
  for_each = var.estado
  filename = "${path.module}/agentes/${each.key}.txt"
  content = "Sigla: ${each.value.sigla}\nCapital: ${each.value.capital}\n"
}


# Exercício 4
output "arquivos" {
  value = [for arquivo in local_file.estado : arquivo.filename]
}
