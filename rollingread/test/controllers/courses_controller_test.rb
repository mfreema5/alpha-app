require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { course_number: @course.course_number, description: @course.description, meet_day1: @course.meet_day1, meet_day2: @course.meet_day2, meet_day3: @course.meet_day3, meet_day4: @course.meet_day4, meet_day5: @course.meet_day5, meet_day6: @course.meet_day6, meet_day7: @course.meet_day7, semester_id: @course.semester_id, short_title: @course.short_title }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { course_number: @course.course_number, description: @course.description, meet_day1: @course.meet_day1, meet_day2: @course.meet_day2, meet_day3: @course.meet_day3, meet_day4: @course.meet_day4, meet_day5: @course.meet_day5, meet_day6: @course.meet_day6, meet_day7: @course.meet_day7, semester_id: @course.semester_id, short_title: @course.short_title }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
