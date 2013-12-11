class AddShopCategoryToShops < ActiveRecord::Migration
  def change
    add_column :shops, :shop_category, :integer
  end
end
