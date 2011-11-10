class AddInReplyToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :in_reply_to, :integer
    add_index  :microposts, :in_reply_to
  end

  def self.down
    remove_column :microposts, :in_reply_to
  end
end
