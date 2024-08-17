class ChangeTypeOfLastNameInStudents < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|

    dir.up do
    change_column :students, :last_name, :text
    end

    dir.down do
    change_column :students, :last_name, :string
    end
    end
  end
end
