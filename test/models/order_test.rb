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

require 'test_helper'

describe Order do
  let(:order) { Order.new }

  describe '#first_name' do
    it 'return first word' do
      order.shipping_name = 'First Last'
      assert_equal order.first_name, 'First'
    end

    it 'returns nil if empty' do
      order.shipping_name = ''
      assert_equal order.first_name, nil
    end
  end

  describe '#quantity' do
    it 'adds the 4 colors together' do
      order.quantity_black = 1
      order.quantity_blue = 1
      order.quantity_red = 1
      order.quantity_green = 1
      assert_equal order.quantity, 4
    end

    it 'defaults to 0 if nil without erroring' do
      order.quantity_black = 1
      order.quantity_blue = 1
      order.quantity_red = nil
      order.quantity_green = 1
      assert_equal order.quantity, 3
    end
  end

  describe 'self#recent_orders' do
    before do
      20.times do
        Order.create(test_params)
      end
    end

    it 'fetches 10 most recent orders' do
      result = Order.recent_orders
      assert_equal result.length, 10
    end

    it "doesn't return senstive data" do
      result = Order.recent_orders
      assert_not_nil result.first
      assert_equal false, result.first.respond_to?(:card_number)
      assert_equal false, result.first.respond_to?(:card_security)
    end
  end

  describe 'self#make_order' do
    it 'should create a new order in the DB' do
      assert_difference('Order.count') do
        Order.make_order
      end
    end
  end

  def test_params
    {
      name_on_card: 'Test Name',
      card_number: '4242424242424242424242',
      card_expires: '12/20',
      card_security: '123',

      billing_street: 'Test Street',
      billing_city: 'Test City',
      billing_state: 'Test State',
      billing_zip: 'Test Zip',
      billing_country: 'Test Country',

      shipping_name: 'Test Name',
      shipping_street: 'Test Street',
      shipping_city: 'Test City',
      shipping_state: 'Test State',
      shipping_zip: 'Test Zip',
      shipping_country: 'Test Country',

      quantity_black: '6'
    }
  end
end
