class CreateShopAttachments < ActiveRecord::Migration
  def change
    create_table :shop_attachments do |t|

      t.timestamps
    end
  end
end
