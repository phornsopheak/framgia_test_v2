FactoryGirl.define do
  factory :option do
    content {Faker::Lorem.sentence}
  end
end
