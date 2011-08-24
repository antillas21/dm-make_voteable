#require 'rails/generators/migration'
require 'rails/generators'
require 'rails/generators/named_base'

class MakeVoteableGenerator < Rails::Generators::Base
  # include Rails::Generators::Migration

  #desc "Generates the Vote model"

  def self.source_root
    @source_root ||= File.dirname(__FILE__) + '/templates'
  end

  #def self.next_migration_number(path)
   # ActiveRecord::Generators::Base.next_migration_number(path)
  #end

  def copy_voting_file
    copy_file 'voting_model.rb', 'app/models/voting.rb'
    DataMapper.auto_upgrade!
  end
end
