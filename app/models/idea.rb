class Idea < ActiveRecord::Base 
  belongs_to :user
  acts_as_votable

  validates :title, presence: true, length: { minimum: 6, maximum: 128 }
  validates :body, length: { maximum: 12000 }

  # This doesn't belong in the model!
  def body_html
    Kramdown::Document.new(body).to_html
  end

  def voters
    votes.up.by_type(User).voters
  end
end