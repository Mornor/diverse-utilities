/* Create a Virtual Private Gateway attached to the main VPC - Assign a default ASN */
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = var.main_vpc_id

  tags = {
    Name = "VPN VGW"
  }
}

/* Attach the VGW to the VPC */
resource "aws_vpn_gateway_attachment" "vpn_attachment" {
  vpc_id         = var.main_vpc_id
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
}

/* Enable Route Propagation */
resource "aws_vpn_gateway_route_propagation" "vpc_route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = var.vpc_route_table_id
}

/* Create a CGW */
resource "aws_customer_gateway" "cgw" {
  bgp_asn    = var.cgw_asn
  ip_address = var.cgw_routable_ip
  type       = "ipsec.1"

  tags = {
    Name = "VPN CGW"
  }
}

/* Site-to-Site VPN connection */
resource "aws_vpn_connection" "site-to-site-vpn-connection" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = true
}
