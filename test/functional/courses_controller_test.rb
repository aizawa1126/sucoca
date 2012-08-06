require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index, club_id: 1
    assert_response :success
    assert_not_nil club_courses_path(1,assigns(:courses))
  end

  test "should get new" do
    get :new, club_id: 1
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, club_id: 1, course: { club_id: @course.club_id, name: @course.name }
    end

    assert_redirected_to club_course_path(1,assigns(:course))
  end

  test "should show course" do
    get :show, club_id: 1, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, club_id: 1, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, club_id: 1, id: @course, course: { club_id: @course.club_id, name: @course.name }
    assert_redirected_to club_course_path(1,assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, club_id: 1, id: @course
    end

    assert_redirected_to club_courses_path
  end
end
