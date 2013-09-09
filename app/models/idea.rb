class Idea < ActiveRecord::Base 
  belongs_to :user
  acts_as_votable

  validates :title, presence: true, length: { minimum: 6, maximum: 128 }
  validates :body, length: { maximum: 12000 }

  # @return [Array] A list of Users that voted for this idea
  def voters
    votes.up.by_type(User).voters
  end

  # @return [Fixnum]
  def total_votes
    votes.size
  end
end