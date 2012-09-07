name "app"
description "Rails appserver"

default_attributes(users: ["deploy"])

run_list(
  [
		"recipe[imagemagick]",
		"recipe[user::data_bag]",
		"recipe[ruby_build]",
		"recipe[rbenv::user]",
		"recipe[mysql::ruby]",
		"recipe[bluepill]"
    ]
)