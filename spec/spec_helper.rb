require 'active_record'
require 'rubygems'
require 'refined'

require File.join(File.dirname(__FILE__), '..', 'lib', 'refined')
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  config.before(:all) { TestMigration.up }
  config.after(:all)  { TestMigration.down }
end
