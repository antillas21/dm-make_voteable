require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler= 'syck'

require 'bundler'
require 'logger'
require 'rspec'
require 'dm-core'
require 'dm-migrations'
require 'dm-active_model'
require 'dm-adjust'
require 'dm-aggregates'
require 'dm-ar-finders'
require 'dm-chunked_query'
require 'dm-core'
require 'dm-do-adapter'
require 'dm-is-nested_set'
require 'dm-observer'
require 'dm-serializer'
require 'dm-timestamps'
require 'dm-transactions'
require 'dm-types'
require 'dm-validations'
require 'dm-zone-types'
require 'rails'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'make_voteable'

# Configure DataMapper
DataMapper::Logger.new($stdout, :debug)
database = YAML.load_file(File.dirname(__FILE__) + '/database.yml')
DataMapper.setup(:default, database['defaults'])
load(File.dirname(__FILE__) + '/models.rb')
DataMapper.auto_migrate!

# Configure RSpec
RSpec.configure do |config|
  config.mock_with :rspec
  
  # [:all, :each].each do |x|
  #   config.before(x) do
  #     repository(:default) do |repository|
  #       transaction = DataMapper::Transaction.new(repository)
  #       transaction.begin
  #       repository.adapter.push_transaction(transaction)
  #     end
  #   end
  # 
  #   config.after(x) do
  #     repository(:default).adapter.pop_transaction.rollback
  #   end
  # end
  
  config.before(:each) do
    #DatabaseCleaner.strategy = :truncation
    #DatabaseCleaner.clean
    repository(:default) do |repository|
      transaction = DataMapper::Transaction.new(repository)
      transaction.begin
      repository.adapter.push_transaction(transaction)
    end

  end

  config.after(:each) do
    #DatabaseCleaner.clean
    repository(:default).adapter.pop_transaction.rollback
  end
  
end