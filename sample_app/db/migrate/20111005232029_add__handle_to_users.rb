class Add_handleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :handle, :string
    add_index :users, :handle, :unique => true
  end

  def self.down
    remove_column :users, :handle
  end
end
