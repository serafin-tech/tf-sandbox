locals {
  db_definition = {
    "db_name_1" = {
      description = "temp description"
      users = {
        "user_1" = {
          roles = ["role1", "role2"]
        }
        "user_2" = {
          roles = ["role1", "role2"]
        }
      }
    }
    "db_name_2" = {
      description = "temp description"
      users = {
        "user_3" = {
          roles = ["role1", "role2"]
        }
        "user_4" = {
          roles = ["role1", "role2"]
        }
      }
    }
  }

  databases = [for key in keys(local.db_definition) : key]

  users = flatten([for val in values(local.db_definition) : keys(val.users)])

  user_roles = flatten([for db_name, db_details in local.db_definition : [
    for u_name, u_roles_obj in db_details.users : {
      user     = u_name
      database = db_name
      roles    = u_roles_obj.roles
    }
    ]
  ])
}

output "db_databases" {
  value = local.databases
}

output "db_users" {
  value = local.users
}

output "db_user_roles_file" {
  value = local_file.db_user_roles.filename
}

resource "local_file" "db_user_roles" {
  content  = jsonencode(local.user_roles)
  filename = "${path.module}/user_roles.json"
}
