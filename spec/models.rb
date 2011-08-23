class Comment
  include DataMapper::Resource
  
  property :id, Serial
  property :body, Text
end

class Voter
  include DataMapper::Resource
  
  property :id, Serial
  property :login, String
  property :name, String
end