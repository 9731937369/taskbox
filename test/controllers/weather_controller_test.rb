require 'test_helper'

class WeatherControllerTest < ActionController::TestCase
  test "should get current" do
    get :current
    assert_response :success
  end

  test "should get forecast" do
    get :forecast
    assert_response :success
  end

end
