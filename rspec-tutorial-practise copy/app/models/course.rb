class Course < ApplicationRecord
  validates :course_name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses  , dependent: :destroy
end
