require_relative '../spec_helper'

describe 'owi-consul::default' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  # I expect the default recipe to not include the following recipes
  it 'Does not include the server recipe' do
    expect(chef_run).to_not include_recipe('owi-consul::server')
  end

end
