require 'test_helper'

class DressTypesControllerTest < ActionController::TestCase
  setup do
    @dress_type = dress_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dress_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dress_type" do
    assert_difference('DressType.count') do
      post :create, dress_type: { dress_id: @dress_type.dress_id, name: @dress_type.name }
    end

    assert_redirected_to dress_type_path(assigns(:dress_type))
  end

  test "should show dress_type" do
    get :show, id: @dress_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dress_type
    assert_response :success
  end

  test "should update dress_type" do
    patch :update, id: @dress_type, dress_type: { dress_id: @dress_type.dress_id, name: @dress_type.name }
    assert_redirected_to dress_type_path(assigns(:dress_type))
  end

  test "should destroy dress_type" do
    assert_difference('DressType.count', -1) do
      delete :destroy, id: @dress_type
    end

    assert_redirected_to dress_types_path
  end
end
