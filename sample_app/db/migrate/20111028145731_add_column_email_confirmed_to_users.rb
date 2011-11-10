class AddColumnEmailConfirmedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_confirmed, :boolean, :default => false, :null=> false
  end

  def self.down
    remove_column :users, :email_confirmed
  end
end
