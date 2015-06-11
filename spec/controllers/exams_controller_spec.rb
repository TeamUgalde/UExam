require 'rails_helper'

RSpec.describe ExamsController, type: :controller do

  let(:valid_attributes) {
    { title: 'Examen Parcial I' }
  }

  let(:invalid_attributes) {
    { wrong: 1, bad: 2, name: '' }
  }

  describe "GET #index" do
    it "loads all of the exams into @exams" do
      exam1, exam2 = Exam.create!, Exam.create!
      get :index

      expect(assigns(:exams)).to match_array([exam1, exam2])
    end
  end

  describe "GET #show" do
    it "loads the requested exam in @exam" do
      exam = Exam.create!
      get :show, {:id => exam.to_param}
      expect(assigns(:exam)).to eq(exam)
    end
  end


  describe "GET #new" do
    it "instantiates a exam in the @exam variable" do
      get :new
      expect(assigns(:exam)).to be_a_new(Exam)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Exam" do
        expect {
          post :create, {:exam => valid_attributes}
        }.to change(Exam, :count).by(1)
      end

      it "assigns a newly created exam as @exam" do
        post :create, {:exam => valid_attributes}
        expect(assigns(:exam)).to be_a(Exam)
        expect(assigns(:exam)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved exam as @exam" do
        post :create, {:exam => invalid_attributes}
        expect(assigns(:exam)).to_not be_a_new(Exam)
      end
    end
  end


  describe "GET #edit" do
    it "assigns the exam that the user wants to edit in the @exam variable" do
      exam = Exam.create! valid_attributes
      get :edit, {:id => exam.to_param}
      expect(assigns(:exam)).to eq(exam)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Nuevo Examen' }
      }

      it "updates the requested exam" do
        exam = Exam.create! valid_attributes
        put :update, {:id => exam.to_param, :exam => new_attributes}
        exam.reload
        expect(controller.notice).to eq('Examen actualizado con exito')
      end

      it "assigns the requested exam as @exam" do
        exam = Exam.create! valid_attributes
        put :update, {:id => exam.to_param, :exam => valid_attributes}
        expect(assigns(:exam)).to eq(exam)
      end
    end

    context "with invalid params" do
      it "assigns the exam as @exam" do
        exam = Exam.create! valid_attributes
        put :update, {:id => exam.to_param, :exam => invalid_attributes}
        expect(assigns(:exam)).to eq(exam)
      end
    end
  end

  describe "DELETE #destroy" do
    context "deleting an existing exam" do
      it "destroys the selected exam" do
        exam = Exam.create! valid_attributes
        expect {
          delete :destroy, {:id => exam.to_param}
        }.to change(Exam, :count).by(-1)
      end
    end

    context "deleting a non-existing exam " do
      it "should result in a RecordNotFound Error" do
        expect {
          delete :destroy, {:id => 32}
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


end
