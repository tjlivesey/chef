name "graylog2"
description "Graylog stack"

run_list(
  [
    "recipe[mongodb]",
		"recipe[graylog2::apache2]",
		"recipe[nginx]"
    ]
)