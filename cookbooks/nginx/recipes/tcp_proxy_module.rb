
tcp_proxy_module_filename = "tcp-proxy-nginx-module.tar.gz"
tcp_proxy_src_filepath = "#{Chef::Config['file_cache_path']}/#{tcp_proxy_module_filename}"
tcp_proxy_extract_path = "#{Chef::Config['file_cache_path']}/nginx_tcp_proxy_module/#{tcp_proxy_module_filename}"

remote_file tcp_proxy_src_filepath do
  source   node['nginx']['tcp_proxy']['url']
  owner    'root'
  group    'root'
  mode     0644
end

bash 'extract_tcp_proxy_module' do
  cwd ::File.dirname(tcp_proxy_src_filepath)
  code <<-EOH
    mkdir -p #{tcp_proxy_extract_path}
    tar xzf #{tcp_proxy_extract_path} -C #{tcp_proxy_extract_path}
    mv #{tcp_proxy_extract_path}/*/* #{tcp_proxy_extract_path}/
  EOH

  not_if { ::File.exists?(tcp_proxy_extract_path) }
end

node.run_state['nginx_configure_flags'] =
  node.run_state['nginx_configure_flags'] | ["--add-module=#{tcp_proxy_extract_path}"]