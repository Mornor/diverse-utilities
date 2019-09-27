#!/bin/bash 

accounts=$(jq -r '.accounts[]' config.json)
tf_files=$(jq -r '.tf_files[]' config.json)

for account in $accounts; do
	mkdir -p accounts/$account
	for tf_file in $tf_files; do
		touch accounts/$account/$tf_file
	done
done
  
# Or use of the following command (example)
# mkdir -p accounts/{dev,shared_services,prod,qa}
# touch accounts/{dev,shared_services,prod,qa}/{main,inputs,outputs}.tf