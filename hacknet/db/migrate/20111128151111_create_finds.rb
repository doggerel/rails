class CreateFinds < ActiveRecord::Migration
  def change
    create_table :finds do |t|

      t.timestamps
    end
  end
end
