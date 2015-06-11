require 'rails_helper'

RSpec.describe SolvedExamsController, type: :controller do

  let(:valid_attributes) {
    { score: 80 }
  }

  let(:invalid_attributes) {
    { wrong: 'a', bad: "no", name: -2 }
  }

  describe "GET #index" do
    it "loads all of the solved_exams into @solved_exams" do
      solved_exam1, solved_exam2 = SolvedExam.create!, SolvedExam.create!
      get :index

      expect(assigns(:solved_exams)).to match_array([solved_exam1, solved_exam2])
    end
  end

  describe "GET #show" do
    it "loads the requested solved_exam in @solved_exam" do
      solved_exam = SolvedExam.create!
      get :show, {:id => solved_exam.to_param}
      expect(assigns(:solved_exam)).to eq(solved_exam)
    end
  end


  describe "GET #new" do
    it "instantiates a solved_exam in the @solved_exam variable" do
      get :new
      expect(assigns(:solved_exam)).to be_a_new(SolvedExam)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new SolvedExam" do
        expect {
          post :create, {:solved_exam => valid_attributes}
        }.to change(SolvedExam, :count).by(1)
      end

      it "assigns a newly created solved_exam as @solved_exam" do
        post :create, {:solved_exam => valid_attributes}
        expect(assigns(:solved_exam)).to be_a(SolvedExam)
        expect(assigns(:solved_exam)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved solved_exam as @solved_exam" do
        post :create, {:solved_exam => invalid_attributes}
        expect(assigns(:solved_exam)).to_not be_a_new(SolvedExam)
      end
    end
  end


  describe "GET #edit" do
    it "assigns the solved_exam that the user wants to edit in the @solved_exam variable" do
      solved_exam = SolvedExam.create! valid_attributes
      get :edit, {:id => solved_exam.to_param}
      expect(assigns(:solved_exam)).to eq(solved_exam)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Nuevo SolvedExamen' }
      }

      it "updates the requested solved_exam" do
        solved_exam = SolvedExam.create! valid_attributes
        put :update, {:id => solved_exam.to_param, :solved_exam => new_attributes}
        solved_exam.reload
        expect(controller.notice).to eq('SolvedExamen actualizado con exito')
      end

      it "assigns the requested solved_exam as @solved_exam" do
        solved_exam = SolvedExam.create! valid_attributes
        put :update, {:id => solved_exam.to_param, :solved_exam => valid_attributes}
        expect(assigns(:solved_exam)).to eq(solved_exam)
      end
    end

    context "with invalid params" do
      it "assigns the solved_exam as @solved_exam" do
        solved_exam = SolvedExam.create! valid_attributes
        put :update, {:id => solved_exam.to_param, :solved_exam => invalid_attributes}
        expect(assigns(:solved_exam)).to eq(solved_exam)
      end
    end
  end

  describe "DELETE #destroy" do
    context "deleting an existing solved_exam" do
      it "destroys the selected solved_exam" do
        solved_exam = SolvedExam.create! valid_attributes
        expect {
          delete :destroy, {:id => solved_exam.to_param}
        }.to change(SolvedExam, :count).by(-1)
      end
    end

    context "deleting a non-existing solved_exam " do
      it "should result in a RecordNotFound Error" do
        expect {
          delete :destroy, {:id => 32}
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


end