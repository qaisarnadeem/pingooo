require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get get_all_countries" do
    get :get_all_countries
    assert_response :success
  end

end
