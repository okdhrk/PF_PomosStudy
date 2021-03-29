class Question < ApplicationRecord

  belongs_to :user

  has_many :answers, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true

end
