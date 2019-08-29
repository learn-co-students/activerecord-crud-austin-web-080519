ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'database_cleaner'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

RSpec.configure do |config|
  # Dear Cody, I think you accidentally added line 14. Getting rid of this will work now.
  # Another thing, you can add 'f' infront of 'context'.
  # config.include Capybara::DSL 
  config.include Rack::Test::Methods
  config.filter_run_including :focus => true
  config.run_all_when_everything_filtered = true

  DatabaseCleaner.strategy = :truncation

  

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end

def __
  raise "Replace __ with test code."
end
