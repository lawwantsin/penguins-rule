# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  name_on_card     :string(255)
#  card_number      :string(255)
#  card_expires     :string(255)
#  card_security    :string(255)
#  billing_street   :string(255)
#  billing_city     :string(255)
#  billing_state    :string(255)
#  billing_zip      :string(255)
#  billing_country  :string(255)
#  shipping_name    :string(255)
#  shipping_street  :string(255)
#  shipping_city    :string(255)
#  shipping_state   :string(255)
#  shipping_zip     :string(255)
#  shipping_country :string(255)
#  quantity         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Order < ActiveRecord::Base

  after_create :push_data

  PRICE = 2.99

  def push_data

    Pusher.trigger('orders', 'new_order', {
      first_name: self.first_name,
      quantity: self.quantity,
      shipping_city: self.shipping_city,
      shipping_country: self.shipping_country,
      created_at: self.created_at
    })

  end

  def quantity
    quantity_red + quantity_black + quantity_green + quantity_blue
  end

  def first_name

    self.shipping_name.split(' ').first.capitalize

  end

  def self.recent_orders

    return order('created_at DESC')
              .limit(10)
              .select('shipping_name, quantity_red, quantity_black, quantity_green, quantity_blue, shipping_city, shipping_name, created_at, shipping_country')
              .all

  end


end
