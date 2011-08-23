require 'rubygems'
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

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'make_voteable'

# Configure DataMapper
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'mysql://localhost/make_voteable_test')
load(File.dirname(__FILE__) + '/models.rb')
DataMapper.automigrate!

# Configure RSpec
RSpec.configure do |config|
  config.mock_with :rspec
  
  [:all, :each].each do |x|
    config.before(x) do
      repository(:default) do |repository|
        transaction = DataMapper::Transaction.new(repository)
        transaction.begin
        repository.adapter.push_transaction(transaction)
      end
    end

    config.after(x) do
      repository(:default).adapter.pop_transaction.rollback
    end
  end
  
end