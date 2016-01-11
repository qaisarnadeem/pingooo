require 'test_helper'

class PrizeRedemptionsControllerTest < ActionController::TestCase
  setup do
    @prize_redemption = prize_redemptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prize_redemptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prize_redemption" do
    assert_difference('PrizeRedemption.count') do
      post :create, prize_redemption: { country_specific_prize_id: @prize_redemption.country_specific_prize_id, game_id: @prize_redemption.game_id, status: @prize_redemption.status, user_id: @prize_redemption.user_id }
    end

    assert_redirected_to prize_redemption_path(assigns(:prize_redemption))
  end

  test "should show prize_redemption" do
    get :show, id: @prize_redemption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prize_redemption
    assert_response :success
  end

  test "should update prize_redemption" do
    patch :update, id: @prize_redemption, prize_redemption: { country_specific_prize_id: @prize_redemption.country_specific_prize_id, game_id: @prize_redemption.game_id, status: @prize_redemption.status, user_id: @prize_redemption.user_id }
    assert_redirected_to prize_redemption_path(assigns(:prize_redemption))
  end

  test "should destroy prize_redemption" do
    assert_difference('PrizeRedemption.count', -1) do
      delete :destroy, id: @prize_redemption
    end

    assert_redirected_to prize_redemptions_path
  end
end
