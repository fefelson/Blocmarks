require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  describe "Associations" do
    it { should belong_to(:topic) }
  end

  describe "Attributes" do
    it { should have_db_column(:url).of_type(:string) }
  end

  describe "Validations" do
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:url) }
  end

end
