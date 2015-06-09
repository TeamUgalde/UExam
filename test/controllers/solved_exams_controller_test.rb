require 'test_helper'

class SolvedExamsControllerTest < ActionController::TestCase
  setup do
    @solved_exam = solved_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solved_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solved_exam" do
    assert_difference('SolvedExam.count') do
      post :create, solved_exam: { correct_answers: @solved_exam.correct_answers, finished: @solved_exam.finished, score: @solved_exam.score }
    end

    assert_redirected_to solved_exam_path(assigns(:solved_exam))
  end

  test "should show solved_exam" do
    get :show, id: @solved_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solved_exam
    assert_response :success
  end

  test "should update solved_exam" do
    patch :update, id: @solved_exam, solved_exam: { correct_answers: @solved_exam.correct_answers, finished: @solved_exam.finished, score: @solved_exam.score }
    assert_redirected_to solved_exam_path(assigns(:solved_exam))
  end

  test "should destroy solved_exam" do
    assert_difference('SolvedExam.count', -1) do
      delete :destroy, id: @solved_exam
    end

    assert_redirected_to solved_exams_path
  end
end
