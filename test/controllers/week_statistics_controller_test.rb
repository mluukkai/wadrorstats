require 'test_helper'

class WeekStatisticsControllerTest < ActionController::TestCase
  setup do
    @week_statistic = week_statistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:week_statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create week_statistic" do
    assert_difference('WeekStatistic.count') do
      post :create, week_statistic: { completed_exercises: @week_statistic.completed_exercises, course_id: @week_statistic.course_id, exercises: @week_statistic.exercises, submissions: @week_statistic.submissions, times: @week_statistic.times, used_time: @week_statistic.used_time, week: @week_statistic.week }
    end

    assert_redirected_to week_statistic_path(assigns(:week_statistic))
  end

  test "should show week_statistic" do
    get :show, id: @week_statistic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @week_statistic
    assert_response :success
  end

  test "should update week_statistic" do
    patch :update, id: @week_statistic, week_statistic: { completed_exercises: @week_statistic.completed_exercises, course_id: @week_statistic.course_id, exercises: @week_statistic.exercises, submissions: @week_statistic.submissions, times: @week_statistic.times, used_time: @week_statistic.used_time, week: @week_statistic.week }
    assert_redirected_to week_statistic_path(assigns(:week_statistic))
  end

  test "should destroy week_statistic" do
    assert_difference('WeekStatistic.count', -1) do
      delete :destroy, id: @week_statistic
    end

    assert_redirected_to week_statistics_path
  end
end
