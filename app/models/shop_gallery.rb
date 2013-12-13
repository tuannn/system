class ShopGallery < ActiveRecord::Base
  belongs_to :shop
  
  validates :name, presence: true
  validates :description, presence: true
  
  mount_uploader :avatar, AvatarUploader
  
end
