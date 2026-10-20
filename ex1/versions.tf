terraform {
    required_providers {
      local = {
        source = "hashicorp/local"
        version = "= 2.5.3"
      }
    }
}

resource "local_file" "print" {
  filename = "${path.module}/texto.txt"
  content = "Olá, GAIA!"
}