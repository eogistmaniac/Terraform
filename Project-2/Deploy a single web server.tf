provider "aws"{
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}
resource "aws_instance" "sweb_server"{
    ami = "ami-0817d428a6fb68645"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sweb_sg.id]
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello World,A web server made using terrform" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    tags = {
        Name = "Terraform_sweb_server"
    }
}
resource "aws_security_group" "sweb_sg"{
    name = "sweb_server_sg"
    ingress{
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}