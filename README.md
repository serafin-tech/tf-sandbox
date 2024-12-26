# Terraform sandbox

## Commands

```sh
set -a; source .env; set +a

terraform init -upgrade
terraform apply -auto-approve

jq '.' user_roles.json
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.db_user_roles](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_temp"></a> [temp](#input\_temp) | temp var | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_databases"></a> [db\_databases](#output\_db\_databases) | n/a |
| <a name="output_db_user_roles_file"></a> [db\_user\_roles\_file](#output\_db\_user\_roles\_file) | n/a |
| <a name="output_db_users"></a> [db\_users](#output\_db\_users) | n/a |
| <a name="output_temp_var"></a> [temp\_var](#output\_temp\_var) | n/a |
<!-- END_TF_DOCS -->