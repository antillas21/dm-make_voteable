require 'make_voteable/voting'
require 'make_voteable/voteable'
require 'make_voteable/voter'
require 'make_voteable/exceptions'

module MakeVoteable
  # Your code goes here...
  def voteable?
    false
  end

  def voter?
    false
  end

  # Specify a model as voteable.
  #
  # Example:
  # class Question
  #   make_voteable
  # end
  def make_voteable 
    include Voteable
  end

  # Specify a model as voter.
  #
  # Example:
  # class User
  #   make_voter
  # end
  def make_voter
    include Voter
  end
  
end

DataMapper::Model.append_extensions MakeVoteable
