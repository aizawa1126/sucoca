require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { account: 'test', password: 'test', password_confirmation: 'test' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    session[:login] = @user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    session[:login] = @user
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    session[:login] = @user
    put :update, id: @user, user: { name: 'hoge' }
    assert_redirected_to user_path(assigns(:user))
  end
end
