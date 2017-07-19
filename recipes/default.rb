#
# Cookbook Name:: owi-consul
# Recipe:: default
# Description::

# If data bag items exist, inject them into the Consul
# attributes for the run
owi_databag_config = node['owi-consul']['data_bag']
owi_config = node['owi-consul']['config']
databag_name = owi_databag_config['name']
items_name = owi_databag_config['secrets']['name']

node.from_file(run_context.resolve_attribute('consul', 'default'))
node.default['consul'] = {}.merge(node['consul'])

if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
elsif Chef::DataBag.list.key?(databag_name)
  if search(databag_name, "id:#{items_name}").any?
    items = data_bag_item(databag_name, items_name)
    node.default['consul']['config'] = node.default['consul']['config'].merge(items['consul'])
  end
end

if owi_config['bind_addr'] == 'ipaddress'
  node.default['consul']['config']['bind_addr'] = node['ipaddress']
end

if owi_config['advertise_addr'].to_s.empty?
  node.default['consul']['config']['advertise_addr'] = node['ipaddress']
end

if owi_config['advertise_addr_wan'].to_s.empty?
  node.default['consul']['config']['advertise_addr_wan'] = node['ipaddress']
end

include_recipe 'consul'

# The run state is used in other recipes in this cookbook. The information
# that comes from the items variable is needed later but is removed at the
# end of the run of this recipe, so I keep this in a run_state for other
# recipes to use
node.run_state['consul'] = {
  'config' => node.default['consul']['config']
}

# Remove the items added to the consul attributes above
unless items.nil?
  items['consul'].each do |k, _v|
    node.rm_default('consul', 'config', k)
  end
end
