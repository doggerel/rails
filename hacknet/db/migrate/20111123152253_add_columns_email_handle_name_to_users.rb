class AddColumnsEmailHandleNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :handle, :string
    add_column :users, :eamil, :string
  end
end
