#
# Cookbook Name:: owi-consul
# Recipe:: consul_bind
# Description:: Sets up Bind for Consul
# This is used if you'd like to use Consul agent on the machine
# as your DNS server. Also requires running the resolver cookbook
# in order to cause resolv.conf to point to 127.0.0.1 as the primary
# nameserver

package 'bind'
package 'bind-utils'
package 'bind-utils'

cookbook_file "/etc/named.conf" do
  owner 'named'
  group 'named'
  mode 00644
  notifies :enable, 'service[rpcbind]', :immediately
  notifies :restart, 'service[rpcbind]', :immediately
end

cookbook_file "/etc/named/consul.conf" do
  owner 'named'
  group 'named'
  mode 00644
  notifies :enable, 'service[rpcbind]', :immediately
  notifies :restart, 'service[rpcbind]', :immediately
end

service 'rpcbind' do
  supports reload: true, status: true
  action :nothing
  subscribes :reload, resources('cookbook_file[/etc/named.conf]'), :delayed
  subscribes :reload, resources('cookbook_file[/etc/named/consul.conf]'), :delayed
end