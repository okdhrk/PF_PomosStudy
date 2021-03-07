class TweetComment < ApplicationRecord

  attachment :image

  belongs_to :user

end
