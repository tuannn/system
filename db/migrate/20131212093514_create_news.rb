class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
      t.string :avatar
      t.string :user_id
      t.string :shop_id

      t.timestamps
    end
  end
end
