class Voting
  
  include DataMapper::Resource
  
  property :id, Serial
  property :voteable_type, String, :index => true
  property :voteable_id, Integer, :index => [:voteable_type, :voteable_id]
  property :voter_type, String, :index => true
  property :voter_id, Integer, :index => [:voter_type, :voter_id]
  property :up_vote, Boolean, :null => false
  property :created_at, DateTime
  property :updated_at, DateTime
  
end