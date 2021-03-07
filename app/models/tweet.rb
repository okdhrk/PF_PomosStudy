class Tweet < ApplicationRecord
    
    attachment :image
    
    belongs_to :user
    
end
