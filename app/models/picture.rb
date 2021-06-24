class Picture < ApplicationRecord
  validates :content,  length: { in: 1..140 }
  validates :content, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
 # favorite_users お気に入りしたユーザー情報
  mount_uploader :img, ImageUploader
end
