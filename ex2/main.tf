terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "= 2.5.3"
    }
  }
}

variable "ambiente" {
  type = string

  validation {
    condition = contains(["dev", "prod"], var.ambiente)
    error_message = "O ambiente deve ser dev ou prod!"
  }
}

resource "local_file" "variavel" {
  filename = "${path.module}/${var.ambiente}.txt"
  content = "Ambiente: ${var.ambiente}"
}