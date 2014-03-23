require 'test_helper'

class MiniprojectsControllerTest < ActionController::TestCase
  setup do
    @miniproject = miniprojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miniprojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miniproject" do
    assert_difference('Miniproject.count') do
      post :create, miniproject: { course_id: @miniproject.course_id, github: @miniproject.github, name: @miniproject.name }
    end

    assert_redirected_to miniproject_path(assigns(:miniproject))
  end

  test "should show miniproject" do
    get :show, id: @miniproject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miniproject
    assert_response :success
  end

  test "should update miniproject" do
    patch :update, id: @miniproject, miniproject: { course_id: @miniproject.course_id, github: @miniproject.github, name: @miniproject.name }
    assert_redirected_to miniproject_path(assigns(:miniproject))
  end

  test "should destroy miniproject" do
    assert_difference('Miniproject.count', -1) do
      delete :destroy, id: @miniproject
    end

    assert_redirected_to miniprojects_path
  end
end
