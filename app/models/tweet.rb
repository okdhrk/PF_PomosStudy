class Tweet < ApplicationRecord

    belongs_to :user

    has_many :tweet_comments, dependent: :destroy

    has_many :claps, dependent: :destroy
    
    def claped_by?(user)
        claps.where(user_id: user.id).exists?
    end

end
