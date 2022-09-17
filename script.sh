#!/bin/bash -ex
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum clean all

export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
