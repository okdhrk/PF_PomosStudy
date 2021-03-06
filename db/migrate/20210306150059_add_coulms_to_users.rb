class AddCoulmsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :string
    add_column :users, :user_genre, :string
    add_column :users, :is_deleted, :boolean
  end
end
