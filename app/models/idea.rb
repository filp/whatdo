class Idea < ActiveRecord::Base 
  belongs_to :user
  acts_as_votable

  validates :title, presence: true, length: { minimum: 3, maximum: 128 }
  validates :body, length: { maximum: 12000 }
  
  scope :by_user, -> id { where(user_id: id.to_i ) }

  # @return [Array] A list of Users that voted for this idea
  def voters
    votes.up.by_type(User).voters
  end

  # @return [Fixnum]
  def total_votes
    votes.size
  end

  # Does this idea belong to the passed user?
  # @param [User] user
  def belongs_to_user?(user)
    self.user == user
  end
end