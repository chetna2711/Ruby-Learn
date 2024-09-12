class RemoveFromStudents < ActiveRecord::Migration[7.0]
  def change

    remove_column :students, :dob
  end
end
