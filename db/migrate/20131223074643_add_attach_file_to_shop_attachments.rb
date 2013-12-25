class AddAttachFileToShopAttachments < ActiveRecord::Migration
  def change
    add_column :shop_attachments, :attachfile, :attachment
  end
end
