provider "aws" {
    region = "us-west-2"
}

module "web"{
    source = "./web"
}

output "PublicIP"{
    value = module.web.pub_ip
}
