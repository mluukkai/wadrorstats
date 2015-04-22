require 'test_helper'

class QuestionnaireAnswersControllerTest < ActionController::TestCase
  setup do
    @questionnaire_answer = questionnaire_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaire_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire_answer" do
    assert_difference('QuestionnaireAnswer.count') do
      post :create, questionnaire_answer: { identifier: @questionnaire_answer.identifier, name: @questionnaire_answer.name }
    end

    assert_redirected_to questionnaire_answer_path(assigns(:questionnaire_answer))
  end

  test "should show questionnaire_answer" do
    get :show, id: @questionnaire_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire_answer
    assert_response :success
  end

  test "should update questionnaire_answer" do
    patch :update, id: @questionnaire_answer, questionnaire_answer: { identifier: @questionnaire_answer.identifier, name: @questionnaire_answer.name }
    assert_redirected_to questionnaire_answer_path(assigns(:questionnaire_answer))
  end

  test "should destroy questionnaire_answer" do
    assert_difference('QuestionnaireAnswer.count', -1) do
      delete :destroy, id: @questionnaire_answer
    end

    assert_redirected_to questionnaire_answers_path
  end
end
