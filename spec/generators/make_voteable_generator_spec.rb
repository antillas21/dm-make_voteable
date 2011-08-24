require 'spec_helper'
require 'action_controller'
require 'generator_spec/test_case'
require 'generators/make_voteable/make_voteable_generator'

describe MakeVoteableGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("/tmp", __FILE__)
  tests MakeVoteableGenerator

  before do
    prepare_destination
    run_generator
  end
  
  it "copies voting.rb to models folder" do
    destination_root.should have_structure {
      directory "app" do
        directory "models" do
          file "voting.rb" do
            contains "class Voting"
          end
        end
      end
    }
  end

  # specify do
  #   destination_root.should have_structure {
  #     directory "app" do
  #       directory "models" do
  #         file "voting.rb" do
  #           contains "class Voting"
  #           contains "include DataMapper::Resource"
  #           contains "property :voteable_type, String, :index => true"
  #         end
  #       end
  #     end
  #   }
  # end
end
