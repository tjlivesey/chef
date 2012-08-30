name "graylog2"
description "Graylog stack"

run_list(
  [
		"recipe[imagemagick]"
    ]
)