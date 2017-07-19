#
# Cookbook Name:: owi-consul
# Recipe:: consul_acl
# Description:: Creates ACL policies for Consul
# TODO: This is astill a work in progress. 

begin
  return unless ! node.run_state['consul']['config']['acl_master_token'].to_s.strip.empty?
rescue
  # There probably is not a node.run_state['consul']['config']['acl_master_token']
  # so the above command errors with undefined method `[]' for nil:NilClass
  return
end

databag_name = node['owi-consul']['data_bag']['name']
acl_items_name = node['owi-consul']['data_bag']['acl']['name']

begin
  if search(databag_name, "id:#{acl_items_name}").any?
    items = data_bag_item(databag_name, acl_items_name)['acl_items']

    items.each do |acl_item|
      next unless !acl_item['id'].to_s.strip.empty? && !acl_item['url'].to_s.strip.empty?

      url = acl_item['url'].to_s.strip.empty? ? '' : acl_item['url']
      acl_name = acl_item['acl_name'].to_s.strip.empty? ? '' : acl_item['acl_name']
      auth_token = node.run_state['consul']['config']['acl_master_token']

      consul_acl id do
        acl_name acl_name
        url url
        type type
        auth_token auth_token
        rules <<-EOS.gsub(/^\s{4}/, '')
			    key "" {
			      policy = "read"
			    }
			    service "" {
			      policy = "write"
			    }
 				  EOS
      end
    end

  end
rescue
  log "Data bag #{databag_name} or data bag item #{acl_items_name} does not exist. ACL items will not be created" do
    level :debug
  end
end
