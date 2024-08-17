class RemoveAddressAndPhoneNoFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :address
    remove_column :students, :phone_no
  end
end
