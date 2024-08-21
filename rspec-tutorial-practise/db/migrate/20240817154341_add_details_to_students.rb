class AddDetailsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :contact_no, :integer
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :country, :string
    add_column :students, :birthdate, :date
  end
end
