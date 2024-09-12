require 'cucumber/rails'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'database_cleaner-active_record'

Capybara.default_driver = :selenium_chrome

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.default_max_wait_time = 10000