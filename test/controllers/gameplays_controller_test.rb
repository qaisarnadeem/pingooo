require 'test_helper'

class GameplaysControllerTest < ActionController::TestCase
  setup do
    @gameplay = gameplays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameplays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameplay" do
    assert_difference('Gameplay.count') do
      post :create, gameplay: { chance_number: @gameplay.chance_number, game_id: @gameplay.game_id, is_hit: @gameplay.is_hit, position_y: @gameplay.position_y, postion_x: @gameplay.postion_x, user_id: @gameplay.user_id }
    end

    assert_redirected_to gameplay_path(assigns(:gameplay))
  end

  test "should show gameplay" do
    get :show, id: @gameplay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameplay
    assert_response :success
  end

  test "should update gameplay" do
    patch :update, id: @gameplay, gameplay: { chance_number: @gameplay.chance_number, game_id: @gameplay.game_id, is_hit: @gameplay.is_hit, position_y: @gameplay.position_y, postion_x: @gameplay.postion_x, user_id: @gameplay.user_id }
    assert_redirected_to gameplay_path(assigns(:gameplay))
  end

  test "should destroy gameplay" do
    assert_difference('Gameplay.count', -1) do
      delete :destroy, id: @gameplay
    end

    assert_redirected_to gameplays_path
  end
end
