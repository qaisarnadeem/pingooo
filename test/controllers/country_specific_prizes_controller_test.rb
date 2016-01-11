require 'test_helper'

class CountrySpecificPrizesControllerTest < ActionController::TestCase
  setup do
    @country_specific_prize = country_specific_prizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_specific_prizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_specific_prize" do
    assert_difference('CountrySpecificPrize.count') do
      post :create, country_specific_prize: { amount: @country_specific_prize.amount, country_id: @country_specific_prize.country_id, scaffold: @country_specific_prize.scaffold, status: @country_specific_prize.status, user_id: @country_specific_prize.user_id }
    end

    assert_redirected_to country_specific_prize_path(assigns(:country_specific_prize))
  end

  test "should show country_specific_prize" do
    get :show, id: @country_specific_prize
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_specific_prize
    assert_response :success
  end

  test "should update country_specific_prize" do
    patch :update, id: @country_specific_prize, country_specific_prize: { amount: @country_specific_prize.amount, country_id: @country_specific_prize.country_id, scaffold: @country_specific_prize.scaffold, status: @country_specific_prize.status, user_id: @country_specific_prize.user_id }
    assert_redirected_to country_specific_prize_path(assigns(:country_specific_prize))
  end

  test "should destroy country_specific_prize" do
    assert_difference('CountrySpecificPrize.count', -1) do
      delete :destroy, id: @country_specific_prize
    end

    assert_redirected_to country_specific_prizes_path
  end
end
