require 'test_helper'

class ScorecardsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @scorecard = scorecards(:one)
    login
  end

  def login
    session[:login] = @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scorecards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scorecard" do
    assert_difference('Scorecard.count') do
      post :create, scorecard: { course_id: @scorecard.course_id, date: @scorecard.date }
    end

    assert_redirected_to scorecard_path(assigns(:scorecard))
  end

  test "should show scorecard" do
    get :show, id: @scorecard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scorecard
    assert_response :success
  end

  test "should update scorecard" do
    put :update, id: @scorecard, scorecard: { course_id: @scorecard.course_id, date: @scorecard.date }
    assert_redirected_to scorecard_path(assigns(:scorecard))
  end

  test "should destroy scorecard" do
    assert_difference('Scorecard.count', -1) do
      delete :destroy, id: @scorecard
    end

    assert_redirected_to scorecards_path
  end
end
