locals {
  map1 = {
    "key1" = {
      "subkey11" = "value1"
      "subkey1b" = "value2"
    }
    "key2" = {
      "subkey2a" = "value3"
      "subkey2b" = "value4"
    }
  }

  map2 = yamldecode(file("${path.module}/input_data.yaml"))

  items = ["key1", "key2"]

  flattened = flatten([
    for key in local.items : [
      for subkey, value in local.map2[key] : {
        key    = key
        subkey = subkey
        value  = value
      }
    ]
  ])

  # Convert the flattened list to a map
  test_map2 = {
    for item in local.flattened :
    "${item.key}.${item.subkey}" => item.value
  }
}

output "test_map2" {
  value = local.test_map2
}

output "yaml_payload" {
  value = local.map2
}
