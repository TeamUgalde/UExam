class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.where("expires_on > ?", Time.now)

    render layout: false
  end

  def user_exams_index
    @exams = Exam.where("user_id = ?", current_user.id)
    render layout: false
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    @solved_exam = SolvedExam.where("exam_id = ?", @exam.id).first
    @items = @exam.items
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    exam_hash = params[:exam]
    title = exam_hash["title"];
    expiration_date = exam_hash["expirationDate"]
    time_limit = exam_hash["timeLimit"].to_i
    item_quantity = exam_hash["itemList"].length
    item_list = exam_hash["itemList"]

    new_exam = Exam.create(title: title, expires_on: expiration_date, time_limit: time_limit, item_quantity: item_quantity, user_id: current_user.id)
    new_exam_id = new_exam.id

    item_list.each_with_index do |itema, index|
      item = itema[1]
      Item.create(question: item["question"], option_1: item["option1"], option_2: item["option2"] , option_3: item["option3"],
                  option_4: item[":option4"], option_5: item["option5"], item_number: index, exam_id: new_exam_id, correct_option: item["correctOption"].to_i)
    end

    render json: "hola"
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to root_path, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:title, :expires_on, :time_limit, :item_quantity)
    end
end
