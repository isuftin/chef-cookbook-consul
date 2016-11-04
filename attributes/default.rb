# If these addresses are not set on converge,
# the IP address of the machine will be used
default['owi-consul']['config']['advertise_addr'] = ''
default['owi-consul']['config']['advertise_addr_wan'] = ''

# If this is set to the string "ipaddress",
# the IP address of the machine will be used
default['owi-consul']['config']['bind_addr'] = nil
