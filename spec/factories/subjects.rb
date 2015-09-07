FactoryGirl.define do
  factory :subject do
    name {Faker::Name.title}
    duration {Faker::Number.between(1, 10)}
    number_of_question {Faker::Number.between(10, 20)}

    after(:create) do |subject|
      FactoryGirl.create_list :question, 40, subject: subject
    end
  end
end
