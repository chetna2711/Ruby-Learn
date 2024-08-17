class Student < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  validates :contact_no, presence: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }

  has_many :blogs
end
