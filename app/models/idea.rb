class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 6, maximum: 128 }
  validates :body, length: { maximum: 12000 }
end
