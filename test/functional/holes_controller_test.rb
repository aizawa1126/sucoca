require 'test_helper'

class HolesControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:one)
    @course = courses(:one)
    @hole = holes(:one)
    @course.club_id = @club.id
    @hole.course_id = @course.id
  end

  test "should get index" do
    get :index, club_id: @club.id, course_id: @course.id
    assert_response :success
    assert_not_nil assigns(:holes)
  end

  test "should get new" do
    get :new, club_id: @club.id, course_id: @course.id
    assert_response :success
  end

  test "should create hole" do
    assert_difference('Hole.count') do
      post :create, club_id: @club.id, course_id: @course.id, hole: {hdcp: @hole.hdcp, number: @hole.number, par: @hole.par, yard: @hole.yard }
    end

    assert_redirected_to club_course_hole_path(@club.id, @course.id, assigns(:hole))
  end

  test "should show hole" do
    get :show, id: @hole, club_id: @club.id, course_id: @course.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hole, club_id: @club.id, course_id: @course.id
    assert_response :success
  end

  test "should update hole" do
    put :update, id: @hole, club_id: @club.id, course_id: @course.id, hole: {course_id: @course.id, hdcp: @hole.hdcp, number: @hole.number, par: @hole.par, yard: @hole.yard }
    assert_redirected_to club_course_hole_path(@club, @course, assigns(:hole))
  end

  test "should destroy hole" do
    assert_difference('Hole.count', -1) do
      delete :destroy, id: @hole, club_id: @club.id, course_id: @course.id
    end

    assert_redirected_to club_course_holes_path
  end
end
