provider "aws" {
    region = "us-east-1"
    access_key = "your key"
    secret_key = "your key"
}
resource "aws_instance" "example_instance" {
    ami = "ami-0817d428a6fb68645"
    instance_type = "t2.micro"
        tags = { 
            Name  = "terraform-example" 
    }
}
