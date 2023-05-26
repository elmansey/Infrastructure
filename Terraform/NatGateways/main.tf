resource "aws_eip" "eip" {
  vpc      = true
  tags = {
    Name = "eip"
  }
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "ngw"
  }
  depends_on = [var.igw_id]
}