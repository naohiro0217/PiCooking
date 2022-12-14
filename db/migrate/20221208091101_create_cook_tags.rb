class CreateCookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cook_tags do |t|

      t.integer :cook_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
