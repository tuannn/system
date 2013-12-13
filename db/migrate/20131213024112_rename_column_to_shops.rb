class RenameColumnToShops < ActiveRecord::Migration
  def change
    rename_column :shops, :shop_category, :shop_category_id
  end
end
