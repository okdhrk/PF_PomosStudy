class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_or_create_for_oauth(auth)
    find_or_create_by!(email: auth.info.email) do |user|
      user.provider = auth.provider,
      user.uid = auth.uid,
      user.name = auth.info.name,
      user.email = auth.info.email,
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # ユーザーのジャンル
  enum user_genre: { "学校": 0, "資格": 1, "その他": 2 }

  attachment :image

  # フォローフォロワー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def followings?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    self.relationships.create(follow_id: other_user.id)
  end

  def unfollow(other_user)
    self.relationships.find_by(follow_id: other_user.id).destroy
  end

  # tweet
  has_many :tweets, dependent: :destroy

  # tweet_comment
  has_many :tweet_comments, dependent: :destroy

  # clap
  has_many :claps, dependent: :destroy

  # question
  has_many :questions

  # answer
  has_many :answers

  # task
  has_many :tasks, dependent: :destroy

  # 勉強時間
  has_many :study_times, dependent: :destroy

  # バリデーション
  validates :name, presence: true


end
