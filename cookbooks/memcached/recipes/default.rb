#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Adapted for use by dropletpay.com to support instances on multiple ports
# for different environments

package "memcached" do
  action :upgrade
end

package "libmemcache-dev" do
  case node[:platform]
  when "redhat","centos","fedora"
    package_name "libmemcached-devel"
  else
    package_name "libmemcache-dev"
  end
  action :upgrade
end

service "memcached" do
  action :start
  supports :status => true, :start => true, :stop => true, :restart => true
end

node[:memcached][:instances].each do |instance|  
  template "/etc/memcached_#{instance}.conf" do
  source "memcached.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :log_file => node[:memcached][instance][:log_file],
    :listen => node[:memcached][instance][:listen],
    :user => node[:memcached][instance][:user],
    :port => node[:memcached][instance][:port],
    :memory => node[:memcached][instance][:memory]
  )
  notifies :restart, resources(:service => "memcached"), :immediately
end


case node[:lsb][:codename]
when "karmic"
  template "/etc/default/memcached" do
    source "memcached.default.erb"
    owner "root"
    group "root"
    mode "0644"
    notifies :restart, resources(:service => "memcached"), :immediately
  end
end
