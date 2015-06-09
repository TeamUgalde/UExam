require 'test_helper'

class ItemAnswersControllerTest < ActionController::TestCase
  setup do
    @item_answer = item_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_answer" do
    assert_difference('ItemAnswer.count') do
      post :create, item_answer: { correct: @item_answer.correct, option_number: @item_answer.option_number, user_answer: @item_answer.user_answer }
    end

    assert_redirected_to item_answer_path(assigns(:item_answer))
  end

  test "should show item_answer" do
    get :show, id: @item_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_answer
    assert_response :success
  end

  test "should update item_answer" do
    patch :update, id: @item_answer, item_answer: { correct: @item_answer.correct, option_number: @item_answer.option_number, user_answer: @item_answer.user_answer }
    assert_redirected_to item_answer_path(assigns(:item_answer))
  end

  test "should destroy item_answer" do
    assert_difference('ItemAnswer.count', -1) do
      delete :destroy, id: @item_answer
    end

    assert_redirected_to item_answers_path
  end
end
