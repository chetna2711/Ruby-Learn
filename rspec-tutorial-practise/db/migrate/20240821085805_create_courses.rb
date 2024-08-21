class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :price

      t.timestamps
    end
  end
end
