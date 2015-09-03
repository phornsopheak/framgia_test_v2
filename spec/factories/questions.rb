FactoryGirl.define do
  factory :question do
    content {Faker::Lorem.sentence}
    question_type {Faker::Number.between(0, 2)}
    state 1
    active 1
    user {User.all.sample}

    after(:create) do |question|
      if question.question_type == "text"
        FactoryGirl.create :option, question: question
      elsif question.question_type == "single_choice"
        FactoryGirl.create :option, question: question, correct: true
        FactoryGirl.create_list :option, 3, question: question, correct: false
      else
        FactoryGirl.create_list :option, 2, question: question, correct: true
        FactoryGirl.create_list :option, 2, question: question, correct: false
      end
    end
  end
end
