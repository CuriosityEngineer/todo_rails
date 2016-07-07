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

end
