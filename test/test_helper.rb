require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'vcr'
require 'dotenv'
require 'httparty'

require_relative '../lib/recipient'
require_relative '../lib/user'
require_relative '../lib/channel'
require_relative '../lib/workspace'
require_relative '../lib/slack_api_error'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock
end
