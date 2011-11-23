class AddColumnsEmailHandleNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :handle, :string
    add_column :users, :email, :string
    add_index :users, :handle, :unique => true
    add_index :users, :email,  :unique => true
  end
end
