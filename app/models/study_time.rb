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


  #validates :begin_time, presence: true
  #validates :finish_time, presence: true
  validate :begin_finish_check

  def begin_finish_check
    errors.add(:finish_time, "の日付を正しく記入してください。") unless
    self.begin_time.to_s < self.finish_time.to_s
  end


  #validate :start_end_check

    #　 なんでこの記述で動作するのかわかりません。受取時間が、現在の時間よりも過ぎているとorder.createできない。
  #def start_end_check
    #errors.add(:pick_up_time, "の日付を正しく記入してください。") unless
    # string型に変換しないと、比較できなかった。
    #Time.zone.now.to_s(:time) < self.pick_up_time.to_s(:time)
 # end


end
