provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "cloudreach-lab"
  region                  = var.aws_region
}

/* Create the KMS key */
resource "aws_kms_key" "key" {
 	description             = "KMS key for state file Bucket"
 	deletion_window_in_days = 10
}

/* Create the S3 Bucket for State Files */
resource "aws_s3_bucket" "terraform" {
 	bucket = var.s3_state_file_bucket_name 

	tags = {
		name = var.s3_state_file_bucket_name 
	}

	versioning {
		enabled = true
	}

	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				kms_master_key_id = "${aws_kms_key.key.arn}"
				sse_algorithm     = "aws:kms"
			}
		}
	}
}

/* Create the DynamoDB for Lock */
resource "aws_dynamodb_table" "terraform" {
 name           = var.dynamodb_table_terraform_lock_name
 read_capacity  = 1
 write_capacity = 1
 hash_key       = "LockID"

 attribute {
   name = "LockID"
   type = "S"
 }
}