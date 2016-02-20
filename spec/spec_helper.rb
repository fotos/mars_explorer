$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mars_explorer'

require 'factory_girl'

RSpec.configure do |config|
  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
