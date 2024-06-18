variable "ingress_http" {
    type = list(number)
    default = [80]
}

variable "ingress_ssh" {
    type = list(number)
    default = [22]
}

variable "egress" {
    type = list(number)
    default = [80, 443]
}

output "sg_name" {
    value = aws_security_group.web_traffic.name
}


resource "aws_security_group" "web_traffic" {
    name = "allow-web-traffic"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
