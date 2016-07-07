require 'rails_helper'

describe TodosController do

  describe "GET #index" do
    it "gets index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end

    it "Assigns todos to @todos" do
      todo = Todo.create(item: 'Wake up!')
      get :index
      expect(assigns[:todos]).to eq ([todo])
    end
  end

  # describe TodosController do
  #   describe "GET 'index' " do
  #     it "returns successful" do
  #        get :index, format: :json
  #       expect(response).to be_success
  #     end
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { todo: { item: 'Hey!' } } }

      it "creates a new Item" do
        expect {
          post :create, valid_params
        }.to change(Todo, :count).by(1)
      end

      it "assigns a newly created todo as @todo" do
        post :create, valid_params
        expect(assigns(:todo)).to be_a(Todo)
        expect(assigns(:todo)).to be_persisted
      end
    end
  end

  describe "PUT #update" do
    let(:current_attributes) { { item: "Bla"} }

    context "with valid params" do
      let(:valid_params) { { item: "Hehehe" } }

      it "updates the requested todo" do
        todo = Todo.create! current_attributes
        put :update, {:id => todo.to_param, :todo => valid_params}
        todo.reload

        expect(todo.item).to eq("Hehehe")
      end

      it "assigns the requested todo as @todo" do
        todo = Todo.create! current_attributes
        put :update, {:id => todo.to_param, :todo => valid_params}
        expect(assigns(:todo)).to eq(todo)
      end

      # it "redirects to the todo" do
      #   todo = todo.create! current_attributes
      #   put :update, {:id => todo.to_param, :todo => valid_params}
      #   expect(response).to redirect_to(todo)
      # end
    end

  #   context "with invalid params" do
  #     let(:invalid_params) { { item: nil} }
  #
  #     it "assigns the todo as @todo" do
  #       todo = todo.create! current_attributes
  #       put :update, {:id => todo.to_param, :todo => invalid_params}
  #       expect(assigns(:todo)).to eq(todo)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       todo = todo.create! current_attributes
  #       put :update, {:id => todo.to_param, :todo => invalid_params}
  #       expect(response).to render_template("edit")
  #     end
  #   end
  end

end
