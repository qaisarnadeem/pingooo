require 'test_helper'

class PrizeCategoriesControllerTest < ActionController::TestCase
  setup do
    @prize_category = prize_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prize_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prize_category" do
    assert_difference('PrizeCategory.count') do
      post :create, prize_category: { amount: @prize_category.amount, description: @prize_category.description, title: @prize_category.title }
    end

    assert_redirected_to prize_category_path(assigns(:prize_category))
  end

  test "should show prize_category" do
    get :show, id: @prize_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prize_category
    assert_response :success
  end

  test "should update prize_category" do
    patch :update, id: @prize_category, prize_category: { amount: @prize_category.amount, description: @prize_category.description, title: @prize_category.title }
    assert_redirected_to prize_category_path(assigns(:prize_category))
  end

  test "should destroy prize_category" do
    assert_difference('PrizeCategory.count', -1) do
      delete :destroy, id: @prize_category
    end

    assert_redirected_to prize_categories_path
  end
end
