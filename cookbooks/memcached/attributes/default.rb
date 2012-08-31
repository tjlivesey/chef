default[:memcached][:instances] = [:staging, :production]

default[:memcached][:staging][:log_file] = "/var/log/memcached_staging.log"
default[:memcached][:staging][:memory] = 32
default[:memcached][:staging][:port] = 11211
default[:memcached][:staging][:user] = "nobody"
default[:memcached][:staging][:listen] = "0.0.0.0"
default[:memcached][:staging][:maxconn] = "1024"

default[:memcached][:production][:log_file] = "/var/log/memcached_production.log"
default[:memcached][:production][:memory] = 64
default[:memcached][:production][:port] = 11212
default[:memcached][:production][:user] = "nobody"
default[:memcached][:production][:listen] = "127.0.0.1"
default[:memcached][:production][:maxconn] = "1024"
