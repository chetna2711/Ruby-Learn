class Skill < ApplicationRecord
  validates :name, presence: true,uniqueness: true

  has_many :student_skills
  has_many :student, through: :student_skills
end
