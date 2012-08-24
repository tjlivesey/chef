name "webserver"
description "The base role for systems that serve HTTP traffic"
run_list "recipe[nginx]", "recipe[user::data_bag]"
default_attributes :users => ["deploy", "tom"]