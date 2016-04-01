require 'test_helper'

class MyObjectsControllerTest < ActionController::TestCase
  setup do
    @my_object = my_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_object" do
    assert_difference('MyObject.count') do
      post :create, my_object: { color: @my_object.color }
    end

    assert_redirected_to my_object_path(assigns(:my_object))
  end

  test "should show my_object" do
    get :show, id: @my_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_object
    assert_response :success
  end

  test "should update my_object" do
    patch :update, id: @my_object, my_object: { color: @my_object.color }
    assert_redirected_to my_object_path(assigns(:my_object))
  end

  test "should destroy my_object" do
    assert_difference('MyObject.count', -1) do
      delete :destroy, id: @my_object
    end

    assert_redirected_to my_objects_path
  end
end
