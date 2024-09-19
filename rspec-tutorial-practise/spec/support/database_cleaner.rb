require 'database_cleaner'

DatabaseCleaner.strategy = :transaction

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
