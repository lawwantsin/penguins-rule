require 'test_helper'

describe OrdersController do
  describe '#index' do
    it 'should return successful response' do
      get :index
      assert_response :success
    end

    it 'should render index template' do
      get :index
      assert_template :index
    end
  end

  describe '#create' do
    it 'should return successful response' do
      post :create, order: test_params
      assert_response :success
    end

    it 'should create order in DB' do
      assert_difference('Order.count') do
        post :create, order: test_params
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
