require_relative '../spec_helper'

describe 'owi-consul::server' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'creates the user via separate cookbook' do
    expect(chef_run).to run_poise_service_user('consul')
  end

  it 'includes the default consul recipe' do
    expect(chef_run).to include_recipe('consul::default')
  end
end
