#!/bin/bash

set -a; source .env; set +a

terraform init -upgrade
terraform plan
