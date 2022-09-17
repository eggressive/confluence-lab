#!/bin/bash -ex
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

cd /home/ec2-user
yum clean all

aws s3api get-object --bucket confluences3bucket --key bootstrap-lab.tz bootstrap.tz
tar -xf bootstrap.tz

dir=$(pwd)

# Confluence
cd $dir/confluence
chmod a+x ./confluence_bootstrap.sh
./confluence_bootstrap.sh --environment 'dev' --db_endpoint 'mi-confluence-dev.coywzhpec1ty.us-east-1.rds.amazonaws.com:5432' --dns_name 'confluence.midevcld.spglobal.com' --min_memory 'Xms4096m' --max_memory 'Xmx4096m' --proxy 'http://squidnat.marketintelligence.spglobal.com:3128'
