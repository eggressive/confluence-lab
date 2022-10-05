# Spins test instance of Confluence datacenter

This command would generate a public and private key
$ ssh-keygen -f terraform_ec2_key

get pem: terraform output -raw key > key.pem && chmod 400 key.pem 

## AWS keys to be passed as environment variables
export TF_VAR_access_key=<AWS access key>
export TF_VAR_secret_key=<AWS secret access key>
