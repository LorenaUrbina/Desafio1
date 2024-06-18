provider "aws" {
    region = "us-west-2"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "web"{
    source = "./web"
}

output "PublicIP"{
    value = module.web.pub_ip
}
