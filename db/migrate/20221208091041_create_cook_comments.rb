class CreateCookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :cook_comments do |t|

      t.text :comment

      t.integer :customer_id, null: false
      t.integer :cook_id, null: false

      t.timestamps
    end
  end
end
