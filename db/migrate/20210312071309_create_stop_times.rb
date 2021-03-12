class CreateStopTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :stop_times do |t|
      t.integer :task_id

      t.timestamps
    end
  end
end
