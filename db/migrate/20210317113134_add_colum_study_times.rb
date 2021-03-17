class AddColumStudyTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :study_times, :begin_time, :datetime
    add_column :study_times, :finish_time, :datetime
  end
end
