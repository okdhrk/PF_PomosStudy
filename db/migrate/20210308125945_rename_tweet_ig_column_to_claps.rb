class RenameTweetIgColumnToClaps < ActiveRecord::Migration[5.2]
  def change
    rename_column :claps, :tweet_ig, :tweet_id
  end
end
