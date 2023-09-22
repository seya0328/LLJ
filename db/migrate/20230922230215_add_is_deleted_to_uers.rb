class AddIsDeletedToUers < ActiveRecord::Migration[6.1]
  def change
    add_column :uers, :is_deleted, :boolean
  end
end
