if RUBY_VERSION.to_f >= 1.9
  require 'simplecov'
  SimpleCov.start { add_filter 'spec' }
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'yaml'
require 'chicago/flow'
require 'chicago/flow/mysql'

unless defined? TEST_DB
  TEST_DB = Sequel.connect(YAML.load(File.read(File.dirname(__FILE__) + "/database.yml")))
end

include Chicago::Flow

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
