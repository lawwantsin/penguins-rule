class OrdersController < ApplicationController

  def index
    @recent_orders = Order.recent_orders
  end

  def workbench
  end

  def create
    @order = Order.new(order_params)
    @order.save ? (render json: {}, status: 201) : (render json: {}, status: 501)
  end

  private

  def order_params

    params.require(:order)
      .permit(:name_on_card,
              :card_number,
              :card_expires,
              :card_security,

              :billing_street,
              :billing_city,
              :billing_state,
              :billing_zip,
              :billing_country,

              :shipping_name,
              :shipping_street,
              :shipping_city,
              :shipping_state,
              :shipping_zip,
              :shipping_country,

              :quantity_black,
              :quantity_blue,
              :quantity_red,
              :quantity_green)

  end

end
