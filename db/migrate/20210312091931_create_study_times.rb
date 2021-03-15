class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.text :memo
      t.datetime :begin_time
      t.datetime :finish_time
      t.integer :total_time

      t.timestamps
    end
  end
end
