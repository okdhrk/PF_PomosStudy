class Answer < ApplicationRecord
  
  belongs_to :user
  
  belongs_to :question
  
  # バリデーション
  validates :body, presence: true
  
end
