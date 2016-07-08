require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #show" do

    before do
      @other_user = User.create!(name: "other_user", email: "other@email.com", password: "password")
      @topic = Topic.create!(title: "title", user: user)
      @my_bookmark = Bookmark.create!(topic: @topic, url: "url.com", user: user)
      @liked_bookmark = Bookmark.create!(topic: @topic, url: "liked_url.com", user: @other_user)
      @like = Like.create!(user: user, bookmark: @liked_bookmark)
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

    it "assigns my_bookmark to @bookmarks" do
      get :show, { id: user.id }
      expect(assigns(:bookmarks)).to eq [@my_bookmark]
    end

    it "assigns liked_bookmark to @like_bookmark" do
      get :show, { id: user.id }
      expect(assigns(:liked_bookmarks)).to eq [@liked_bookmark]
    end
  end

end
