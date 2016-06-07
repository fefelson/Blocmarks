FactoryGirl.define do

  factory :topic do
    title Faker::Book.title
    user nil
  end
end
