FactoryGirl.define do
  factory :subject do
    name {Faker::Name.title}
    duration {Faker::Number.between(60, 120)}
    number_of_question {Faker::Number.between(20, 30)}
    chatwork_room_id "36496057"

    after(:create) do |subject|
      FactoryGirl.create_list :question, 40, subject: subject
    end
  end
end
