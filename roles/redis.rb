name "redis"
description "Redis server"

run_list(
  [
    "recipe[redis]"
  ]
)