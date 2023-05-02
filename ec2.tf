# Creates a SPOT Instance
resource "aws_spot_instance_request" "spot" {
  ami           = 
  instance_type = "c4.xlarge"

  tags = {
    Name = "CheapWorker"
  }
}