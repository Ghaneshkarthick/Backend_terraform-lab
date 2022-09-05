terraform {
    backend "s3" {
        bucket = "ta-labbucket"
        key = "ta-labbucket/backend/terraform.tfstates"
        region = "eu-west-1"
        #dynamodb_table = "terraform-lock"
  }
}

