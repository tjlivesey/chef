name "app"
description "Rails appserver"

default_attributes(
  users: ["deploy", "tom"],
  rbenv: {
    global: "1.9.3-p194"
  }
)

run_list(
  [
		"recipe[imagemagick]",
		"recipe[user::data_bag]",
		"recipe[ruby_build]",
		"recipe[rbenv::system]"
    ]
)