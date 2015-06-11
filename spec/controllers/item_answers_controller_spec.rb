require 'rails_helper'

RSpec.describe ItemAnswersController, type: :controller do

  let(:valid_attributes) {
    { correct: true }
  }

  let(:invalid_attributes) {
    { wrong: 1, bad: 2, name: '' }
  }

  describe "GET #index" do
    it "loads all of the item_answers into @item_answers" do
      item_answer1, item_answer2 = ItemAnswer.create!, ItemAnswer.create!
      get :index

      expect(assigns(:item_answers)).to match_array([item_answer1, item_answer2])
    end
  end

  describe "GET #show" do
    it "loads the requested item_answer in @item_answer" do
      item_answer = ItemAnswer.create!
      get :show, {:id => item_answer.to_param}
      expect(assigns(:item_answer)).to eq(item_answer)
    end
  end


  describe "GET #new" do
    it "instantiates a item_answer in the @item_answer variable" do
      get :new
      expect(assigns(:item_answer)).to be_a_new(ItemAnswer)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new ItemAnswer" do
        expect {
          post :create, {:item_answer => valid_attributes}
        }.to change(ItemAnswer, :count).by(1)
      end

      it "assigns a newly created item_answer as @item_answer" do
        post :create, {:item_answer => valid_attributes}
        expect(assigns(:item_answer)).to be_a(ItemAnswer)
        expect(assigns(:item_answer)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item_answer as @item_answer" do
        post :create, {:item_answer => invalid_attributes}
        expect(assigns(:item_answer)).to_not be_a_new(ItemAnswer)
      end
    end
  end


  describe "GET #edit" do
    it "assigns the item_answer that the user wants to edit in the @item_answer variable" do
      item_answer = ItemAnswer.create! valid_attributes
      get :edit, {:id => item_answer.to_param}
      expect(assigns(:item_answer)).to eq(item_answer)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Nuevo ItemAnsweren' }
      }

      it "updates the requested item_answer" do
        item_answer = ItemAnswer.create! valid_attributes
        put :update, {:id => item_answer.to_param, :item_answer => new_attributes}
        item_answer.reload
        expect(controller.notice).to eq('ItemAnsweren actualizado con exito')
      end

      it "assigns the requested item_answer as @item_answer" do
        item_answer = ItemAnswer.create! valid_attributes
        put :update, {:id => item_answer.to_param, :item_answer => valid_attributes}
        expect(assigns(:item_answer)).to eq(item_answer)
      end
    end

    context "with invalid params" do
      it "assigns the item_answer as @item_answer" do
        item_answer = ItemAnswer.create! valid_attributes
        put :update, {:id => item_answer.to_param, :item_answer => invalid_attributes}
        expect(assigns(:item_answer)).to eq(item_answer)
      end
    end
  end

  describe "DELETE #destroy" do
    context "deleting an existing item_answer" do
      it "destroys the selected item_answer" do
        item_answer = ItemAnswer.create! valid_attributes
        expect {
          delete :destroy, {:id => item_answer.to_param}
        }.to change(ItemAnswer, :count).by(-1)
      end
    end

    context "deleting a non-existing item_answer " do
      it "should result in a RecordNotFound Error" do
        expect {
          delete :destroy, {:id => 32}
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


end