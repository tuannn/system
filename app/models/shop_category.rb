class ShopCategory < ActiveRecord::Base
  
  has_many :shop
  
  validates :name, presence:true, uniqueness: true
end
