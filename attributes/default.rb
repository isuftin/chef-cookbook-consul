# If these addresses are not set on converge,
# the IP address of the machine will be used
default['owi-consul']['config']['advertise_addr'] = ''
default['owi-consul']['config']['advertise_addr_wan'] = ''

# If this is set to the string "ipaddress",
# the IP address of the machine will be used
default['owi-consul']['config']['bind_addr'] = nil

# Any items in the hash for this data bag will be converted
# to the Consul attributes required by the downstream cookbook
# only for the client run. The attributes will then be removed
# after the run. This allows us to inject secrets into the run
# via an encrypted data bag to feed into the Consul cookbook
#
# For example, if this cookbook's data bag has an item:
# {
# 	"id" : "consul",
# 	"encrypt" : "Q7EuxolHM+NawIgFkXegIA=="
# }
#
# This will be converted by the default recipe to a node attribute:
# default['consul']['encrypt'] = "Q7EuxolHM+NawIgFkXegIA=="
#
# This node attribute will then be removed after the client run
default['owi-consul']['data_bag']['name'] = 'owi-consul-_default'
default['owi-consul']['data_bag']['secrets']['name'] = 'secrets'

# Check .kitchen.yml. If you are creating ACL rules, this
# is the name of the databag from which ACL rules will be
# attained.
# default['owi-consul']['data_bag']['acl']['name'] = 'acl_server or acl_client'
