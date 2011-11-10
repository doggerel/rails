class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
    add_index :messages,[:from_user_id,:to_user_id,:created_at]
  end
end
