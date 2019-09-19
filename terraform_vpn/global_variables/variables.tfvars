aws_region  = "eu-central-1"

/* Terraform infrastructure */
s3_state_file_bucket_name           = "state-file-bucket-experiment"
dynamodb_table_terraform_lock_name  = "lock-table-terraform"

/* VPC and Subnet */
main_vpc_cidr_block       = "10.0.0.0/16"
private_subnet_cidr_block = "10.0.0.0/24"

/* VPN */
cgw_asn         = 65000
cgw_routable_ip = "XXX.XXX.XXX.XXXX"