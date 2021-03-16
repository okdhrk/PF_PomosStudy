class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.text :memo
      t.datetime :begin_time, null: false, default: 0
      t.datetime :finish_time, null: false, default: 0
      t.integer :total_time, null: false, default: 0

      t.timestamps
    end
  end
end
