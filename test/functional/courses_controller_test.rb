require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:one)
    @course = courses(:one)
    @course.club_id = @club.id
  end

  test "should get index" do
    get :index, club_id: @course.club_id
    assert_response :success
    assert_not_nil club_courses_path(1,assigns(:courses))
  end

  test "should get new" do
    get :new, club_id: @course.club_id
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, club_id: @club.id, course: { name: @course.name }
    end

    assert_redirected_to club_course_path(@course.club_id, assigns(:course))
  end

  test "should show course" do
    get :show,  club_id: @course.club_id, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, club_id: @course.club_id, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, club_id: @course.club_id, id: @course, course: { club_id: @course.club_id, name: @course.name }
    assert_redirected_to club_course_path
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, club_id: @course.club_id, id: @course
    end

    assert_redirected_to club_courses_path
  end
end
