class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :name_on_card
      t.string :card_number
      t.string :card_expires
      t.string :card_security

      t.string :billing_street
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zip
      t.string :billing_country

      t.string :shipping_name
      t.string :shipping_street
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip
      t.string :shipping_country

      t.integer :quantity

      t.timestamps null: false
    end
  end
end
