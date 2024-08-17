class Student < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  has_many :blogs
end
