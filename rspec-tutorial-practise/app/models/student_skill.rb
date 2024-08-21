class StudentSkill < ApplicationRecord
  validates :rating, presence: true
  belongs_to :student
  belongs_to :skill
end
