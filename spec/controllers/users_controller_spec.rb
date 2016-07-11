require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #show" do

    before do
      @topic = Topic.create!(title: "title", user: user)
    end

    it "returns http success" do
      get :show, { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, { id: user.id }
      expect(response).to render_template(:show)
    end

    it "assigns user to @user" do
      get :show, { id: user.id }
      expect(assigns(:user)).to eq user
    end

    it "assigns Topic.all to @topics" do
      get :show, { id: user.id }
      expect(assigns(:topics)).to eq [@topic]
    end
  end

end
