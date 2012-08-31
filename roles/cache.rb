name "cache"
description "Cache server"

run_list(
  [
    "recipe[memcached]"
  ]
)