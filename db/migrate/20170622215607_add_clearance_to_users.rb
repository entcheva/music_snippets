class AddClearanceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_password, :string, limit: 128
    add_column :users, :confirmation_token, :string, limit: 128
    add_column :users, :remember_token, :string, limit: 128
    add_index :users, :email
    add_index :users, :remember_token
  end
end
