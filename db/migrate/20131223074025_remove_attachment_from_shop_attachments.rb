class RemoveAttachmentFromShopAttachments < ActiveRecord::Migration
  def change
    remove_column :shop_attachments, :attachment, :string
  end
end
