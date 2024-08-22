class Skill < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :type, presence: true

  has_many :student_skills
  has_many :student, through: :student_skills
end
