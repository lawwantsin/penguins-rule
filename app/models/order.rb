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

  # Connect to pusher, send appropriate data
  def push_data
    Pusher.trigger('orders', 'new_order',       first_name: first_name,
                                                quantity: quantity,
                                                shipping_city: shipping_city,
                                                shipping_country: shipping_country,
                                                created_at: created_at)
  end

  # Add all quanities, default to 0 if nil
  def quantity
    (quantity_red || 0) +
      (quantity_black || 0) +
      (quantity_green || 0) +
      (quantity_blue || 0)
  end

  # Get first name from Shipping name.
  def first_name
    return nil if shipping_name.empty?
    shipping_name.split(' ').first.capitalize
  end

  # Fetch recent orders without all that credit card info we don't need.
  def self.recent_orders
    order('created_at DESC')
      .limit(10)
      .select('shipping_name, quantity_red, quantity_black, quantity_green, quantity_blue, shipping_city, shipping_name, created_at, shipping_country')
      .all
  end

  # Helper for the rake task.
  def self.make_order
    @names = %w(Jim Marcy Kim Bob Frank Janet Sarah Heather)
    @locations = [
      { city: 'Paris', country: 'France' },
      { city: 'London', country: 'United Kingdom' },
      { city: 'Ciaro', country: 'Eygpt' },
      { city: 'New York', country: 'United States' },
      { city: 'San Jose', country: 'Costa Rica' },
      { city: 'Tunis', country: 'Tunesia' },
      { city: 'Montreal', country: 'Canada' }
    ]
    @qty = (rand(10) + 10.to_i)
    location = @locations.sample
    params = {
      shipping_name: @names.sample,
      quantity_black: @qty,
      shipping_city: location[:city],
      shipping_country: location[:country]
    }
    Order.create(params)
  end
end
