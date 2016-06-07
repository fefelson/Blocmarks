require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Associations" do
    it { should have_many(:topics) }
  end

  describe "Attributes" do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe "Validations" do
    # Name
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }
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

end
