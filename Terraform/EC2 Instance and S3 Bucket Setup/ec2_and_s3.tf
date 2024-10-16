/*day 2

resource "aws_instance" "t1"{
  ami = "ami-0dee22c13ea7a9a67"
  tags = {
    Name="first instance"
    name="test"
  }
  instance_type = "t2.micro"
  
  security_groups = ["default"]
  key_name = "seytan_cloud"
}


resource "aws_s3_bucket" "testgkseytan" {
  bucket = "seytangkbukket"
  

}*/

