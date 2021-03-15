class StudyTime < ApplicationRecord

  belongs_to :user

  # 学習時間の計算
  def total_time
    @total_time = 0
    @total_time = @total_time + study_time.finish_time - study_time.begin_time
  end

end
