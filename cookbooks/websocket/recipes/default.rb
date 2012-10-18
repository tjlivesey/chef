gem_package 'thin' do
  action :install
end

dirs = ["#{node[:websocket][:dir]}/config/ssl"]

dirs.each do |dir|
  directory dir  do
    owner node[:websocket][:user]
    group node[:websocket][:group]
    mode 0755
    recursive
    action :create
  end
end

