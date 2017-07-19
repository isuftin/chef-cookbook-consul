#
# Cookbook Name:: owi-consul
# Recipe:: iptables
# Description:: Creates IPTables rules based on available attributes
# See: https://github.com/chef-cookbooks/iptables
# Requires: iptables >= 3.0.0

include_recipe 'iptables'

node['owi-consul']['iptables'].map do |rule_name, rule_body|
  iptables_rule rule_name do
    lines [rule_body].flatten.join("\n")
  end
end
