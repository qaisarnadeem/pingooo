require 'test_helper'

class PingooConfigurationsControllerTest < ActionController::TestCase
  setup do
    @pingoo_configuration = pingoo_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pingoo_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pingoo_configuration" do
    assert_difference('PingooConfiguration.count') do
      post :create, pingoo_configuration: { configuration_id: @pingoo_configuration.configuration_id, value: @pingoo_configuration.value }
    end

    assert_redirected_to pingoo_configuration_path(assigns(:pingoo_configuration))
  end

  test "should show pingoo_configuration" do
    get :show, id: @pingoo_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pingoo_configuration
    assert_response :success
  end

  test "should update pingoo_configuration" do
    patch :update, id: @pingoo_configuration, pingoo_configuration: { configuration_id: @pingoo_configuration.configuration_id, value: @pingoo_configuration.value }
    assert_redirected_to pingoo_configuration_path(assigns(:pingoo_configuration))
  end

  test "should destroy pingoo_configuration" do
    assert_difference('PingooConfiguration.count', -1) do
      delete :destroy, id: @pingoo_configuration
    end

    assert_redirected_to pingoo_configurations_path
  end
end
