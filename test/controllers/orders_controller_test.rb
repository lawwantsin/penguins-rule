require "test_helper"

describe OrdersController do
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get create" do
    get :create
    assert_response :success
  end

end
