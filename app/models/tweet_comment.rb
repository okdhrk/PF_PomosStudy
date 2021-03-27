class TweetComment < ApplicationRecord

  belongs_to :user

  belongs_to :tweet

  # バリデーション
  validates :comment, presence: true

end
