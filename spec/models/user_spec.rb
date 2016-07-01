require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Associations" do
    it { should have_many(:topics) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
  end

  describe "Attributes" do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe "Validations" do
    # Name
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    # Email
    it { should validate_length_of(:email).is_at_least(3)}
    it { should allow_value("user@blocipedia.com").for(:email)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email).case_insensitive }
    # Password
    it { should validate_presence_of(:password)}
    it { should validate_length_of(:password).is_at_least(6)}
  end

  describe "#liked(bookmark)" do
    before do
      @user = User.create!(name: "User", email: "user@blocmarks.com", password: "password")
      # @user.skip_confirmation!
      @other_user = User.create!(name: "Other_User", email: "other_user@blocmarks.com", password: "password")
      # @other_user.skip_confirmation!
      @topic = Topic.create!(title: "New Topic", user: @other_user)
      @bookmark = Bookmark.create!(url: "url.bookmark.com", user: @other_user, topic: @topic)
    end

    it "returns nil if user has not liked the bookmark" do
      expect(@user.liked(@bookmark)).to be_nil
    end

    it "returns the appropriate like if it exists" do
      like = @user.likes.where(bookmark: @bookmark).create
      expect(@user.liked(@bookmark)).to eq(like)
    end
  end

end
