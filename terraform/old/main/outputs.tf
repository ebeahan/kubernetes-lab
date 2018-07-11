output "aws_vpc.main.id" {
  value = "${aws_vpc.main.id}"
}

output "aws_subnet.public.id" {
  value = "${aws_subnet.public.id}"
}

output "aws_subnet.private.id" {
  value = "${aws_subnet.private.id}"
}

output "aws_vpc.main.cidr_block" {
  value = "${aws_vpc.main.cidr_block}"
}

output "aws_subnet.public.cidr_block" {
  value = "${aws_subnet.public.cidr_block}"
}

output "aws_subnet.private.cidr_block" {
  value = "${aws_subnet.private.cidr_block}"
}
