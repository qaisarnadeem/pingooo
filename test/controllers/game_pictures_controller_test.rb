require 'test_helper'

class GamePicturesControllerTest < ActionController::TestCase
  setup do
    @game_picture = game_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_picture" do
    assert_difference('GamePicture.count') do
      post :create, game_picture: { competition_picture: @game_picture.competition_picture, is_used: @game_picture.is_used, picture: @game_picture.picture }
    end

    assert_redirected_to game_picture_path(assigns(:game_picture))
  end

  test "should show game_picture" do
    get :show, id: @game_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_picture
    assert_response :success
  end

  test "should update game_picture" do
    patch :update, id: @game_picture, game_picture: { competition_picture: @game_picture.competition_picture, is_used: @game_picture.is_used, picture: @game_picture.picture }
    assert_redirected_to game_picture_path(assigns(:game_picture))
  end

  test "should destroy game_picture" do
    assert_difference('GamePicture.count', -1) do
      delete :destroy, id: @game_picture
    end

    assert_redirected_to game_pictures_path
  end
end
