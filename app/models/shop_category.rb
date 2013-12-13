class ShopCategory < ActiveRecord::Base
  
  has_many :shops
  has_many :news, through: :shops
  
  validates :name, presence:true, uniqueness: true
end
