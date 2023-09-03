#!/bin/bash

password=$(aws ecr get-login-password --region us-west-2)
token=$(echo "AWS:$password" | base64 --wrap=0)
auth_file="{
  \"auths\": {
    \"366964232567.dkr.ecr.us-west-2.amazonaws.com\": {
      \"auth\": \"$token\"
    }
  }
}"
auth_file_encoded=$(echo $auth_file | base64 --wrap=0)
echo $auth_file_encoded
