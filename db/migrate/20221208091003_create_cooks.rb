class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|

      t.integer :customer_id
      t.string :title, null: false
      t.text :body, null: false
      t.float :rate, null: false
      t.string :tag, null: false

      t.timestamps
    end
  end
end
