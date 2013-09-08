class User < ActiveRecord::Base
  NAME_FORMAT = /^[A-z][A-z0-9_\ ]+$/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true, length: { minimum: 4, maximum: 64 }

  validate :name_is_acceptable_format

  def name_is_acceptable_format
    # Validate that the display name has an acceptable format,
    # and that it does not contain more than one space in a row.
    unless name.match(NAME_FORMAT) && name["  "].nil?
      errors.add(:name, "is not in an acceptable format")
    end
  end
end
