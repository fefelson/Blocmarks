require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user, name: 'other_user', email: 'other_user@email.com')}
  let(:my_topic) { create(:topic, user: my_user) }
  let(:liked_bookmark) { create(:bookmark, topic: my_topic, user: other_user) }
  let(:bookmark) { create(:bookmark, topic: my_topic, user: my_user) }
  let!(:like) { create(:like, user:my_user, bookmark: liked_bookmark) }

  before do
    my_user.confirm
    sign_in(my_user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all liked bookmarks to @bookmarks" do
      get :index
      expect(assigns(:bookmarks)).to eq [liked_bookmark]
    end

    it "doesnt assign bookmarks that weren't liked" do
      get :index
      expect(assigns(:bookmarks)).not_to include(bookmark)
    end
  end

  describe 'POST #create' do
    it 'creates a like for the current user and specified bookmark' do
      new_liked_bookmark = Bookmark.create!(topic: my_topic, url: 'new_liked_bookmark.com', user: other_user)
      request.env["HTTP_REFERER"] = topic_path(my_topic)

      expect(my_user.likes.find_by_bookmark_id(new_liked_bookmark.id)).to be_nil
      post :create, { bookmark_id: new_liked_bookmark.id }
      expect(my_user.likes.find_by_bookmark_id(new_liked_bookmark.id)).not_to be_nil
    end
  end

    describe 'DELETE #destroy' do
      it 'destroys the like for the current user and bookmark' do
        request.env["HTTP_REFERER"] = topic_path(my_topic)
        expect( my_user.likes.find_by_bookmark_id(liked_bookmark.id) ).not_to be_nil
        delete :destroy, { bookmark_id: liked_bookmark.id, id: like.id }
        expect( my_user.likes.find_by_bookmark_id(liked_bookmark.id) ).to be_nil
      end
    end

end
