require_relative 'boot'

require 'rails/all'

# Azure Key Vault
require 'key_vault'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTodo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    config.after_initialize do
      bearer_token = KeyVault::Auth.new(ENV['AZURE_TENANT_ID'], ENV['AZURE_CLIENT_ID'], ENV['AZURE_CLIENT_SECRET']).get_bearer_token
      vault = KeyVault::Client.new("demoaks", nil, bearer_token)

      # Get Secrets from Azure Key Vault
      ENV['MYSQLHOST']  = vault.get_secret("MYSQLHOST", nil)
      ENV['MYSQLUSER']  = vault.get_secret("MYSQLUSER", nil)
      ENV['MYSQLPASS']  = vault.get_secret("MYSQLPASS", nil)
      ENV['MYSQLPORT']  = vault.get_secret("MYSQLPORT", nil)
      ENV['MYSQLDB']    = vault.get_secret("MYSQLDB", nil)
      ENV['MYSQLCA']    = vault.get_secret("MYSQLCA", nil)
    end
  end
end
