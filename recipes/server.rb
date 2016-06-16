#
# Cookbook Name:: owi-consul
# Recipe:: server
#

service_user = node['consul']['service_user']
service_group  = node['consul']['service_group']

poise_service_user service_user do
  group service_group
end

if node['owi-consul']['config']['bind_addr'].to_s.empty?
  node.default['consul']['config']['bind_addr'] = node['ipaddress']
end

if node['owi-consul']['config']['advertise_addr'].to_s.empty?
  node.default['consul']['config']['advertise_addr'] = node['ipaddress']
end

if node['owi-consul']['config']['advertise_addr_wan'].to_s.empty?
  node.default['consul']['config']['advertise_addr_wan'] = node['ipaddress']
end

include_recipe 'consul::default'
