package "monit" do
  action :install
end

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "admin"
    mode 0644
  end
end

service "monit" do
  action :start
  enabled true
  supports [:start, :restart, :stop]
end

template "/etc/monit/monitrc" do
  owner "deploy"
  group "admin"
  mode 0700
  source 'monitrc.erb'
  notifies :restart, resources(:service => "monit"), :immediate
end

directory "/etc/monit/conf.d/" do
  owner  'root'
  group 'admin'
  mode 0770
  action :create
  recursive true
end
