#!/bin/bash

set -a; source .env; set +a

terraform init -upgrade
terraform apply -auto-approve

jq '.' user_roles.json
