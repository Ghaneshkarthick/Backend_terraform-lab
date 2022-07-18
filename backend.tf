terraform {
    backend "s3" {
        bucket = "talent-academy-g-bucket"
        key = "talent-academy/backend/terraform.tfstates"
  }
}