class AddReferencesToStudentCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_courses, :student, null: false, foreign_key: { on_delete: :cascade }
    add_reference :student_courses, :course, null: false, foreign_key: { on_delete: :cascade }
  end
end
