class AddattachfileFileNameToShopAttachments < ActiveRecord::Migration
  def change
    add_column :shop_attachments, :attachfile_file_name, :string
  end
end
