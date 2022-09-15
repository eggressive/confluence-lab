This command would generate a public and private key
$ ssh-keygen -f terraform_ec2_key

get pem: terraform output -raw key > mykey && chmod 400 key.pem 