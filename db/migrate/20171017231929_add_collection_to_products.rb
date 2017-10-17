class AddCollectionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :collection, :string
  end
end
