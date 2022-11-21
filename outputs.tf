#Module      : VPC
#Description : Module VPC outputs.
output "vpc_id" {
  value       = join("", aws_vpc.default.*.id)
  description = "The ID of the VPC."
}

output "vpc_cidr_block" {
  value       = join("", aws_vpc.default.*.cidr_block)
  description = "The CIDR block of the VPC."
}

output "vpc_main_route_table_id" {
  value       = join("", aws_vpc.default.*.main_route_table_id)
  description = "The ID of the main route table associated with this VPC."
}

output "vpc_default_network_acl_id" {
  value       = join("", aws_vpc.default.*.default_network_acl_id)
  description = "The ID of the network ACL created by default on VPC creation."
}

output "vpc_default_security_group_id" {
  value       = join("", aws_vpc.default.*.default_security_group_id)
  description = "The ID of the security group created by default on VPC creation."
}

output "vpc_default_route_table_id" {
  value       = join("", aws_vpc.default.*.default_route_table_id)
  description = "The ID of the route table created by default on VPC creation."
}

output "vpc_ipv6_association_id" {
  value       = join("", aws_vpc.default.*.ipv6_association_id)
  description = "The association ID for the IPv6 CIDR block."
}

output "ipv6_cidr_block" {
  value       = join("", aws_vpc.default.*.ipv6_cidr_block)
  description = "The IPv6 CIDR block."
}

#Module      : INTERNET GATEWAY
#Description : Terraform internet gateway module output variables.
output "igw_id" {
  value       = join("", aws_internet_gateway.default.*.id)
  description = "The ID of the Internet Gateway."
}

output "elb_dns_name" {
  value = aws_lb.alb_nginx.dns_name
}


output "vpn_access_server_dns" {
  value = [
    "ssh the openvpn-server instance:",
    "ssh -i ~/.ssh/id_rsa ec2-user@$<DNS_BELOW/Public IP> ",
    # get into the root Directory
    "cd /",
    # bind the container with public ip and remove old config
    "docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_genconfig -u udp://<Publicip vpn-instance>:3000",
    # Create Cert of VPN
    "docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn ovpn_initpki",
    # Run the VPN container
    "docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn ovpn_initpki",
    # Create the VPN user for CLient
    "docker run -v $PWD/vpn-data:/etc/openvpn --rm -it myownvpn easyrsa build-client-full mustafa nopass",
    # Export the user configuration for vpn client
    "docker run -v $PWD/vpn-data:/etc/openvpn --rm myownvpn ovpn_getclient mustafa > /home/ec2-user/mustafa.ovpn",


    aws_eip.vpn_access_server.public_dns
    ]
}