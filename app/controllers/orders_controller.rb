class OrdersController < ApplicationController
  def index
  end

  def create
    redirect_to root_url
  end
end
