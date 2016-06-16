require 'spec_helper.rb'

describe user('consul') do
  it { should exist }
  it { should belong_to_group 'consul' }
end

describe group('consul') do
  it { should exist }
end
