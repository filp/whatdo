class User < ActiveRecord::Base
  has_many :ideas
  acts_as_voter
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true, length: { minimum: 3, maximum: 128 },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/}
end
