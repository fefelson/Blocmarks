require "rails_helper"

RSpec.describe BookmarkPolicy do

  let(:my_user) { create(:user, name: 'my_user', email: 'my_user@blocmark.com') }
  let(:other_user) { create(:user, name: 'other_user', email: 'other_user@blocmark.com') }
  let(:topic) { create(:topic, user: my_user) }
  let(:my_bookmark) { create(:bookmark, topic: topic, user: my_user) }

  subject { described_class }


  permissions :update?, :edit? do
    it "denies access if bookmark does not belong to user" do
      expect(subject).not_to permit(other_user, my_bookmark)
    end

    it "grants access if bookmark belongs to user" do
      expect(subject).to permit(my_user, my_bookmark)
    end
  end

  permissions :destroy? do
    it "denies access if bookmark does not belong to user" do
      expect(subject).not_to permit(other_user, my_bookmark)
    end

    it "grants access if bookmark belongs to user" do
      expect(subject).to permit(my_user, my_bookmark)
    end
  end
end
