class CreateBeginTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :begin_times do |t|
      t.integer :task_id

      t.timestamps
    end
  end
end
