name "web"
description "The base role for systems that serve HTTP traffic"
run_list "recipe[user::data_bag]", "recipe[nginx]"
default_attributes :users => ["deploy"]