class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.datetime :study
      t.integer :total_time

      t.timestamps
    end
  end
end
