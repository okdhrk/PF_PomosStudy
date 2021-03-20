class ChangeDatatypeStudyDayOfStudyTimes < ActiveRecord::Migration[5.2]
  def change
    change_column :study_times, :study_day, :date
  end
end
