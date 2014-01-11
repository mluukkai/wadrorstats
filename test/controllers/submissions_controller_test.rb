require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, submission: { a1: @submission.a1, comments: @submission.comments, email: @submission.email, first_name: @submission.first_name, hours: @submission.hours, identifier: @submission.identifier, last_name: @submission.last_name, points: @submission.points, student_number: @submission.student_number, week: @submission.week }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, id: @submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission
    assert_response :success
  end

  test "should update submission" do
    patch :update, id: @submission, submission: { a1: @submission.a1, comments: @submission.comments, email: @submission.email, first_name: @submission.first_name, hours: @submission.hours, identifier: @submission.identifier, last_name: @submission.last_name, points: @submission.points, student_number: @submission.student_number, week: @submission.week }
    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission
    end

    assert_redirected_to submissions_path
  end
end
