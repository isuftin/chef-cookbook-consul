# https://github.com/sethvargo/chefspec#packaging-custom-matchers

if defined?(ChefSpec)
  def run_poise_service_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:poise_service_user, :create, resource_name)
  end
end
