class ChangeDateUserGenreToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_genre, :integer
  end
end
