module MakeVoteable
  
  class Voting
    include DataMapper::Resource
    
    attr_accessor :voteable, :voter, :up_vote
    
    property :id, Serial
    property :voteable_type, String, :index => true
    property :voteable_id, Integer, :index => true
    property :voter_type, String, :index => true
    property :voter_id, Integer, :index => true
    property :up_vote, Boolean, :required => true, :default => true
    property :created_at, DateTime
    property :updated_at, DateTime
    
    # belongs_to :voteable, :model => "MakeVoteable::Voteable", :child_key => [:voteable_id]
    # belongs_to :voter, :model => "MakeVoteable::Voter", :child_key => [:voter_id]
  end
  
  # class Voting < ActiveRecord::Base
  #     attr_accessible :voteable, :voter, :up_vote
  # 
  #     belongs_to :voteable, :polymorphic => true
  #     belongs_to :voter, :polymorphic => true
  #   end
end