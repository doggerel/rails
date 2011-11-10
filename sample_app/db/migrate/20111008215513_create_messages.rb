class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :message
      t.integer :user_id
      t.integer :message_to_id

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :message_to_id
  end

  def self.down
    drop_table :messages
  end
end
