class Shop < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :shop_category
  
  has_many :shop_galleries
  has_many :news
  has_many :shop_attachments
  
  validates :name, :description, :shop_category_id, :email, presence:true
    
  mount_uploader :avatar, AvatarUploader
  
  scope :usershop, ->(user_id) { where("user_id = ?", user_id) unless user_id.nil? }
end
