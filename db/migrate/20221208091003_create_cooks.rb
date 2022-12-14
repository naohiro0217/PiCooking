class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|

      t.integer :customer_id

      # 投稿のタイトル
      t.string :title, null: false

      # 感想・内容
      t.text :body, null: false

      # レビューの星
      t.float :rate, null: false

      t.timestamps
    end
  end
end
