require 'test_helper'

class VersionControlsControllerTest < ActionController::TestCase
  setup do
    @version_control = version_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:version_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create version_control" do
    assert_difference('VersionControl.count') do
      post :create, version_control: { course_id: @version_control.course_id, done: @version_control.done, email: @version_control.email, first_name: @version_control.first_name, last_name: @version_control.last_name, student_id: @version_control.student_id, student_number: @version_control.student_number }
    end

    assert_redirected_to version_control_path(assigns(:version_control))
  end

  test "should show version_control" do
    get :show, id: @version_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @version_control
    assert_response :success
  end

  test "should update version_control" do
    patch :update, id: @version_control, version_control: { course_id: @version_control.course_id, done: @version_control.done, email: @version_control.email, first_name: @version_control.first_name, last_name: @version_control.last_name, student_id: @version_control.student_id, student_number: @version_control.student_number }
    assert_redirected_to version_control_path(assigns(:version_control))
  end

  test "should destroy version_control" do
    assert_difference('VersionControl.count', -1) do
      delete :destroy, id: @version_control
    end

    assert_redirected_to version_controls_path
  end
end
