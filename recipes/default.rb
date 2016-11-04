#
# Cookbook Name:: owi-consul
# Recipe:: default
#

if node['owi-consul']['config']['bind_addr'] == 'ipaddress'
  node.default['consul']['config']['bind_addr'] = node['ipaddress']
end

if node['owi-consul']['config']['advertise_addr'].to_s.empty?
  node.default['consul']['config']['advertise_addr'] = node['ipaddress']
end

if node['owi-consul']['config']['advertise_addr_wan'].to_s.empty?
  node.default['consul']['config']['advertise_addr_wan'] = node['ipaddress']
end