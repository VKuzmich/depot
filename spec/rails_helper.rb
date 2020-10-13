# frozen_string_literal: true

require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails env is running in prod. mode!') if Rails.env.production?
require 'rspec/rails'
# require 'database_cleaner'
# require 'ffaker'
require 'shoulda/matchers'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = false
  # config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  # config.before(:each) { DatabaseCleaner.strategy = :transaction }
  # config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
  # config.before(:each) { DatabaseCleaner.start }
  # config.after(:each) { DatabaseCleaner.clean }
  # config.before(:all) { DatabaseCleaner.start }
  # config.after(:all) { DatabaseCleaner.clean }
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# RSpec.configure do |config|
#   [:controller, :view, :request].each do |type|
#     config.include ::Rails::Controller::Testing::TestProcess, :type => type
#     config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
#     config.include ::Rails::Controller::Testing::Integration, :type => type
#   end
# end
