class SolvedExamsController < ApplicationController
  before_action :set_solved_exam, only: [:show, :edit, :update, :destroy]

  # GET /solved_exams
  # GET /solved_exams.json
  def index
    state = params[:state].eql?("True")
    @solved_exams = SolvedExam.where("user_id = ? AND finished = ?", current_user.id, state)
    render layout: false
  end

  def get_correct_answers
    solved_exam = SolvedExam.find(params[:id])
    correct_answers = solved_exam.correct_answers
    render json: correct_answers
  end

  # GET /solved_exams/1
  # GET /solved_exams/1.json
  def show
  end

  # GET /solved_exams/new
  def new
    @solved_exam = SolvedExam.new
  end

  # GET /solved_exams/1/edit
  def edit
  end

  # POST /solved_exams
  # POST /solved_exams.json
  def create
    @solved_exam = SolvedExam.new(solved_exam_params)
    @solved_exam.save
    render layout:false
  end

  # PATCH/PUT /solved_exams/1
  # PATCH/PUT /solved_exams/1.json
  def update
    @solved_exam = SolvedExam.update(correct_answers: params[:correct_answers])
  end

  # DELETE /solved_exams/1
  # DELETE /solved_exams/1.json
  def destroy
    @solved_exam.destroy
    respond_to do |format|
      format.html { redirect_to solved_exams_url, notice: 'Solved exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solved_exam
      @solved_exam = SolvedExam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solved_exam_params
      params.require(:solved_exam).permit(:finished, :score, :correct_answers, :user_id, :exam_id)
    end
end
