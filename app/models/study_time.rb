class StudyTime < ApplicationRecord

  belongs_to :user

  def total_time
    if self.begin_time && self.finish_time
      return ((self.finish_time - self.begin_time) / 60 / 60).round(2)
    else
      return 0
    end
  end

  def is_same_month(month)
    bt = self.begin_time
    ft = self.finish_time
    return (bt && ft) && (bt.month == month && ft.month == month)
  end


end
