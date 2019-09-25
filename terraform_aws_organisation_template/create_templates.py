import os
import json

def load_from_config(config_file_path):
  with open(config_file_path) as f:
    config = json.load(f)
    accounts = config['accounts']
    tf_files = config['tf_files']
    return accounts, tf_files
	

def create_template(accounts, tf_files):
  for account in accounts: 
    if not os.path.exists(account):
      os.makedirs(os.path.join('./accounts/', account))


accounts, tf_files = load_from_config('config.json')
create_template(accounts, tf_files)

