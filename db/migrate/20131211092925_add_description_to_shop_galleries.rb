class AddDescriptionToShopGalleries < ActiveRecord::Migration
  def change
    add_column :shop_galleries, :description, :string
  end
end
