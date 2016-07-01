require "rails_helper"

RSpec.describe LikePolicy do

  let(:my_user) { create(:user, name: 'my_user', email: 'my_user@blocmark.com') }
  let(:other_user) { create(:user, name: 'other_user', email: 'other_user@blocmark.com') }
  let(:topic) { create(:topic, user: my_user) }
  let(:bookmark) { create(:bookmark, topic: topic, user: other_user) }
  let(:like) { create(:like, user: my_user, bookmark: bookmark) }

  subject { described_class }

  permissions :create? do
    it "grants access if bookmark does not belong to user" do
      expect(subject).to permit(other_user, Like)
    end

    it "grants access if bookmark belongs to user" do
      expect(subject).to permit(my_user, Like)
    end
  end

  permissions :destroy? do
    it "denies access if like does not belong to user" do
      expect(subject).not_to permit(other_user, like)
    end

    it "grants access if bookmark belongs to user" do
      expect(subject).to permit(my_user, like)
    end
  end
end
