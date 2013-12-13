class CreateShopGalleries < ActiveRecord::Migration
  def change
    create_table :shop_galleries do |t|
      t.integer :shop_id
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
