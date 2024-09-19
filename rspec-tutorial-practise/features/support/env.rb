require 'cucumber/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.default_driver = :selenium_chrome

DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

Capybara.ignore_hidden_elements = false # Ensure all elements are considered
Capybara.default_max_wait_time = 5 # Increase wait time to allow for dynamic elements
