name "wordpress"
description "Sets up wordpress server"
run_list(
	[
		"recipe[wordpress::default]",
	]
)