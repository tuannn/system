class AddColumnToShopAttachment < ActiveRecord::Migration
  def change
    add_column :shop_attachments, :shop_id, :integer
    add_column :shop_attachments, :attachment, :string
    add_column :shop_attachments, :description, :string
  end
end
