terraform {
    backend "s3" {
        bucket = "talent-academy-g-bucket"
        key = "talent-academy/backend/terraform.tfstates"
        region = "eu-west-1"
        dynamodb_table = "terraform-lock"
  }
}

