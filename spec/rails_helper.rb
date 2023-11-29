# spec/rails_helper.rb
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'

RSpec.configure do |config|
  # Other configurations...

  config.include FactoryBot::Syntax::Methods

  # Other configurations...
end
