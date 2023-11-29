# spec/spec_helper.rb
require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  # This line is important for FactoryBot to work
  config.include FactoryBot::Syntax::Methods

  # DatabaseCleaner setup
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Other configurations...
end
