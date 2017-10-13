class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :upc
      t.string :sku
      t.string :brand
      t.string :size
      t.string :currency
      t.string :retail
      t.string :wholesale
      t.string :img_url

      t.timestamps
    end
  end
end
