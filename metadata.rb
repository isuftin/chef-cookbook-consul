name             'owi-consul'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'CPL-1.0'
description      'Wrapper cookbook around the community Consul cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports         'centos', '>= 6.6'
supports         'centos', '>= 7.1'

source_url 'https://github.com/USGS-CIDA/chef-cookbook-consul' if respond_to?(:source_url)
issues_url 'https://github.com/USGS-CIDA/chef-cookbook-consul/issues' if respond_to?(:issues_url)

depends 'consul'
depends 'iptables', '~> 4.2.0'

chef_version '>= 12.0.0'
