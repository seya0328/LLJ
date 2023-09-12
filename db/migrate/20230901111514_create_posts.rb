class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :child_id
      t.string :date, null: false
      t.string :title, null: false
      t.text :content
      t.timestamps
    end
  end
end
