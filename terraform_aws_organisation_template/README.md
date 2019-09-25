## Create Terraform structure
This code create a Terraform folders structure I ususally use during my projects. 
Fill up the `config.json` file and execute the Python code: `python3 create_templates.py`.
For example, the following config file
```
{
  "accounts": [
    "dev", 
    "shared_services",
    "prod", 
    "qa"
  ], 
  "tf_files": [
    "main.tf", 
    "inputs.tf", 
    "outputs.tf"
  ]
}
```
Will produce the following structure: 
```
├── accounts
│   ├── dev
│   │   ├── inputs.tf
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── prod
│   │   ├── inputs.tf
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── qa
│   │   ├── inputs.tf
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── shared_services
│       ├── inputs.tf
│       ├── main.tf
│       └── outputs.tf
```

### Docker command
If you wish to use Docker, or are too lazy to install Python, you can use the following commands
```
docker run -it -v $PWD:/t -w /t python:alpine sh -c 'python create_templates.py'
```