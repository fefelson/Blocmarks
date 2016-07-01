require 'rails_helper'

RSpec.describe Like, type: :model do

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:bookmark) }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:bookmark) }
  end

end
