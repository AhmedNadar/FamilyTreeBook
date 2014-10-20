ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# This class to solve the error "ArgumentError: uncaught throw :warden" when I run the test
# http://shobhitic.tumblr.com/post/82973462163/getting-argumenterror-uncaught-throw-warden-with
class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
	include Devise::TestHelpers
end