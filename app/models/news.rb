class News < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  
  mount_uploader :avatar, AvatarUploader
  
  validates :title, presence: true
  validates :content, presence: true
  
end
