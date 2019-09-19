all: init apply
init:
	@terraform init

clean:
	@rm -Rf .terraform || true

plan:
	@terraform plan -var-file=../global_variables/variables.tfvars

apply:
	@terraform apply -var-file=../global_variables/variables.tfvars

destroy:
	@terraform destroy -var-file=../global_variables/variables.tfvars