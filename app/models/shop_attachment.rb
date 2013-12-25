class ShopAttachment < ActiveRecord::Base
  has_attached_file :attachfile
  
  belongs_to :shop
  
end
