class Tweet < ApplicationRecord

    attachment :image

    belongs_to :user

    has_many :tweet_comments

end
