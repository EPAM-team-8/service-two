terraform {
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

#   backend "s3"{
#     region = "us-east-2"
#     bucket = "epam-terraform-remote-state"
#     dynamodb_table = "terraform-lock"
#     key  = "terraform/state.tfstate"
#     encrypt = true
#   }
# }
