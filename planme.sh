#!/bin/bash

terraform init -upgrade
terraform plan -var 'temp=temp'
