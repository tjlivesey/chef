name "tools"
description "admin tools as well as droplet dashboard"
run_list "recipe[user::data_bag]", "recipe[nginx::passenger]"
default_attributes :users => ["deploy"]