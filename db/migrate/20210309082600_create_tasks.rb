class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :body
      t.date :target_at
      t.date :completed_at
      t.boolean :completed, default: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
