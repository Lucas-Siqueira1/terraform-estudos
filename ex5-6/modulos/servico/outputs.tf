resource "random_pet" "random_url" {
  length = 2
  separator = "-"
}

output "url" {
  value = "https://${var.nome}-${random_pet.random_url.id}.com"
}