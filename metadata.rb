name             'owi-consul'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'Public Domain'
description      'Wrapper cookbook around the community Consul cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

source_url 'https://github.com/USGS-CIDA/chef-cookbook-consul' if respond_to?(:source_url)
issues_url 'https://github.com/USGS-CIDA/chef-cookbook-consul/issues' if respond_to?(:issues_url)

depends 'consul'
depends 'iptables', '>= 3.0.0'
