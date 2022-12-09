class AddEmailPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users,:email,:string
    add_column :users,:encrypted_password,:string
  end
end
