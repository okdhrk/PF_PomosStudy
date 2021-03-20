class RenameStudyColumnToStudyTimes < ActiveRecord::Migration[5.2]
  def change
    
    rename_column :study_times, :study, :study_day
    
  end
end
