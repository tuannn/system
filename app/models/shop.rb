class Shop < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :shop_category
  
  validates :name, :description, :shop_category, :email, presence:true
    
  mount_uploader :avatar, AvatarUploader
  
  scope :usershop, ->(user_id) { where("user_id = ?", user_id) unless user_id.nil?}
end
