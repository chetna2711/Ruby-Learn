# features/support/devise.rb
require 'cucumber/rails'
require 'devise'
require 'warden/test/helpers'

World(Warden::Test::Helpers)

After do
  Warden.test_reset!
end



RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end
