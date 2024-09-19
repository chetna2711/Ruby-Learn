class AddDeviseToStudents < ActiveRecord::Migration[6.0]
  def change
    ## Database authenticatable
    # add_column :students, :email,              :string, null: false, default: ""
    add_column :students, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    add_column :students, :reset_password_token,   :string
    add_column :students, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :students, :remember_created_at, :datetime

    ## Trackable
    add_column :students, :sign_in_count,      :integer, default: 0, null: false
    add_column :students, :current_sign_in_at, :datetime
    add_column :students, :last_sign_in_at,    :datetime
    add_column :students, :current_sign_in_ip, :string
    add_column :students, :last_sign_in_ip,    :string

    ## Confirmable
    # add_column :students, :confirmation_token,   :string
    # add_column :students, :confirmed_at,         :datetime
    # add_column :students, :confirmation_sent_at, :datetime
    # add_column :students, :unconfirmed_email,    :string # Only if using reconfirmable

    ## Lockable
    # add_column :students, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    # add_column :students, :unlock_token,    :string # Only if unlock strategy is :email or :both
    # add_column :students, :locked_at,       :datetime

    add_index :students, :email,                unique: true
    add_index :students, :reset_password_token, unique: true
    # add_index :students, :confirmation_token,   unique: true
    # add_index :students, :unlock_token,         unique: true
  end
end
