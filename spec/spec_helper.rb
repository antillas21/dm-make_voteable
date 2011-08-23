$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'make_voteable'

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