class ColorQuantitiesAndVariedPrices < ActiveRecord::Migration
  def change

    add_column :orders, :quantity_black, :integer, :default => 0
    add_column :orders, :quantity_blue, :integer, :default => 0
    add_column :orders, :quantity_red, :integer, :default => 0
    add_column :orders, :quantity_green, :integer, :default => 0

    remove_column :orders, :quantity, :integer

    add_column :orders, :price, :decimal, :precision => 5, :scale => 2

  end
end
