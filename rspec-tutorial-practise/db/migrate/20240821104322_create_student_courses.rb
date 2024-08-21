class CreateStudentCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :student_courses do |t|
      t.integer :course_rating

      t.timestamps
    end
  end
end
