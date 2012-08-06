require 'test_helper'

class HolesControllerTest < ActionController::TestCase
  setup do
    @hole = holes(:one)
  end

  test "should get index" do
    get :index, club_id: 1, course_id: 1
    assert_response :success
    assert_not_nil assigns(:holes)
  end

  test "should get new" do
    get :new, club_id: 1, course_id: 1
    assert_response :success
  end

  test "should create hole" do
    assert_difference('Hole.count') do
      post :create, club_id: 1, course_id: 1, hole: {hdcp: @hole.hdcp, number: @hole.number, par: @hole.par, yard: @hole.yard }
    end

    assert_redirected_to club_course_hole_path(1,1,assigns(:hole))
  end

  test "should show hole" do
    get :show, id: @hole, club_id: 1, course_id: 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hole, club_id: 1, course_id: 1
    assert_response :success
  end

  test "should update hole" do
    put :update, id: @hole, club_id: 1, course_id: 1, hole: {course_id: @hole.course_id, hdcp: @hole.hdcp, number: @hole.number, par: @hole.par, yard: @hole.yard }
    assert_redirected_to club_course_hole_path(1,1,assigns(:hole))
  end

  test "should destroy hole" do
    assert_difference('Hole.count', -1) do
      delete :destroy, id: @hole, club_id: 1, course_id: 1
    end

    assert_redirected_to club_course_holes_path
  end
end
