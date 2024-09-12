class CreateStudentSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :student_skills do |t|
      t.references :student, null: false, foreign_key: { on_delete: :cascade }
      t.references :skill, null: false, foreign_key: { on_delete: :cascade }
      t.integer :rating

      t.timestamps
    end
  end
end
