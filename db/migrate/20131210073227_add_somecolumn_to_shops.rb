class AddSomecolumnToShops < ActiveRecord::Migration
  def change
    add_column :shops, :email, :string
    add_column :shops, :address, :string
    add_column :shops, :tel, :string
    add_column :shops, :avatar, :string
  end
end
