require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:valid_attributes) {
    { question: 'Pregunta #1' }
  }

  let(:invalid_attributes) {
    { wrong: 1, bad: 2, name: '' }
  }

  describe "GET #index" do
    it "loads all of the items into @items" do
      item1, item2 = Item.create!, Item.create!
      get :index

      expect(assigns(:items)).to match_array([item1, item2])
    end
  end

  describe "GET #show" do
    it "loads the requested item in @item" do
      item = Item.create!
      get :show, {:id => item.to_param}
      expect(assigns(:item)).to eq(item)
    end
  end


  describe "GET #new" do
    it "instantiates a item in the @item variable" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, {:item => valid_attributes}
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:item => valid_attributes}
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        post :create, {:item => invalid_attributes}
        expect(assigns(:item)).to_not be_a_new(Item)
      end
    end
  end


  describe "GET #edit" do
    it "assigns the item that the user wants to edit in the @item variable" do
      item = Item.create! valid_attributes
      get :edit, {:id => item.to_param}
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Nuevo Itemen' }
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => new_attributes}
        item.reload
        expect(controller.notice).to eq('Itemen actualizado con exito')
      end

      it "assigns the requested item as @item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => valid_attributes}
        expect(assigns(:item)).to eq(item)
      end
    end

    context "with invalid params" do
      it "assigns the item as @item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => invalid_attributes}
        expect(assigns(:item)).to eq(item)
      end
    end
  end

  describe "DELETE #destroy" do
    context "deleting an existing item" do
      it "destroys the selected item" do
        item = Item.create! valid_attributes
        expect {
          delete :destroy, {:id => item.to_param}
        }.to change(Item, :count).by(-1)
      end
    end

    context "deleting a non-existing item " do
      it "should result in a RecordNotFound Error" do
        expect {
          delete :destroy, {:id => 32}
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


end