FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    password "12345678"
    password_confirmation "12345678"
    sequence(:email) {|n| "test-#{n}@fts.com"}
    chatwork_id "1308655"
    admin false

    after(:create) do |user|
      FactoryGirl.create :exam, user: user
    end
  end
end
