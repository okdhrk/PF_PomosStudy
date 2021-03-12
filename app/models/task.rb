class Task < ApplicationRecord

  belongs_to :user

  belongs_to :begin_time
  belongs_to :stop_time

end
