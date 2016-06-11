require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe "Attributes" do
    it { should have_db_column(:title).of_type(:string) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:bookmarks).dependent(:destroy) }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }

  end

end
