class RenameColumnInStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :contact_no, :phone_no
    
  end
end
