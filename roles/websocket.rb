name "websocket"
description "Runs a websocket server. Nginx for SSL termination and proxy. Thin server to serve websocket requests."
run_list "recipe[nginx::source]"