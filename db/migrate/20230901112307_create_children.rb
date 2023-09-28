class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :birthday, null: false
      t.integer :gender, null: false, default: 0
      t.string :personality, null: false
      t.string :is_deleted, default: false, null: false
      t.timestamps
    end
  end
end
