class News < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  
  mount_uploader :avatar, AvatarUploader
  
  validates :title, presence: true, length: {maximum: 64}
  validates :content, presence: true
  
  scope :othernews, ->(news_id) {where("id != ?", news_id) unless news_id.nil?}
  
end
