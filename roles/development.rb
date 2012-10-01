name "development"
description "Development node"
run_list ([
  "recipe[user::data_bag]", 
  "recipe[ruby_build]",
  "recipe[rbenv::user]",
  "recipe[mysql::ruby]", 
  "recipe[sqlite3]", 
  "recipe[imagemagick]",
  "recipe[memcached]",
  "recipe[redis]"
])
  
default_attributes :users => ["deploy"]