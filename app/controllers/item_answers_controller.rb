class ItemAnswersController < ApplicationController
  before_action :set_item_answer, only: [:show, :edit, :update, :destroy]

  # GET /item_answers
  # GET /item_answers.json
  def index
    @item_answers = ItemAnswer.all
  end

  # GET /item_answers/1
  # GET /item_answers/1.json
  def show
  end

  # GET /item_answers/new
  def new
    @item_answer = ItemAnswer.new
  end

  def get_item_answers
    item_answers = ItemAnswer.where("solved_exam_id = ?", params[:id])
    user_answers = Array.new
    item_answers.each do |item|
      hash = Hash.new
      hash["isCorrect"] = item.correct
      hash["itemNumber"] = item.option_number

      user_answers.push(item)
    end
    render
  end

  # GET /item_answers/1/edit
  def edit
  end

  # POST /item_answers
  # POST /item_answers.json
  def create
    ItemAnswer.create(user_answer: params[:userAnswer], correct: params[:isCorrect], option_number: params[:itemNumber], solved_exam_id: params[:solvedExamId])
    render json: "Exito"

  end

  # PATCH/PUT /item_answers/1
  # PATCH/PUT /item_answers/1.json
  def update
    respond_to do |format|
      if @item_answer.update(item_answer_params)
        format.html { redirect_to @item_answer, notice: 'Item answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_answer }
      else
        format.html { render :edit }
        format.json { render json: @item_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_answers/1
  # DELETE /item_answers/1.json
  def destroy
    @item_answer.destroy
    respond_to do |format|
      format.html { redirect_to item_answers_url, notice: 'Item answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_answer
      @item_answer = ItemAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_answer_params
      params.require(:item_answer).permit(:option_number, :user_answer, :correct)
    end
end
