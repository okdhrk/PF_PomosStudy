class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :body
      t.datetime :target_at
      t.datetime :completed_at
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
