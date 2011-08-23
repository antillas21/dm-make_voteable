class VoteableModel
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :up_votes, Integer, :required => true, :default => 0
  property :down_votes, Integer, :required => true, :default => 0
  
  make_voteable
end

class VoterModel
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :up_votes, Integer, :required => true, :default => 0
  property :down_votes, Integer, :required => true, :default => 0
  
  make_voter
end

class InvalidVoteableModel
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
end

class Voting
  include DataMapper::Resource
  
  property :id, Serial
  property :voteable_type, String, :index => true
  property :voteable_id, Integer, :index => true
  property :voter_type, String, :index => true
  property :voter_id, Integer, :index => true
  property :up_vote, Boolean, :required => true, :default => true
  property :created_at, DateTime
  property :updated_at, DateTime
end

# ActiveRecord::Schema.define :version => 0 do
  
  # add_index :votings, [:voteable_type, :voteable_id]
  #add_index :votings, [:voter_type, :voter_id]
  # add_index :votings, [:voteable_type, :voteable_id, :voter_type, :voter_id], :name => "unique_voters", :unique => true
# end