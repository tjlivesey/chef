name "database"
description "Mysql install"
run_list ([
  "recipe[mysql::client]", 
  "recipe[mysql::server]", 
  "recipe[mysql::ruby]"
])
  
default_attributes :users => ["deploy"]