class CreateCookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cook_tags do |t|

      t.integer :cook_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
