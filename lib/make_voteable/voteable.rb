module MakeVoteable
  module Voteable
    extend ActiveSupport::Concern

    included do
      has n, :votings, :model => "MakeVoteable::Voting", :as => :voteable
    end

    module ClassMethods
      def voteable?
        true
      end
    end

    # Return the difference of down and up votes.
    # May be negative if there are more down than up votes.
    def votes
      self.up_votes - self.down_votes
    end
  end
end