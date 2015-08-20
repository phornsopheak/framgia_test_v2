FactoryGirl.define do
  factory :exam do
    subject
    status {Settings.status.start}
  end
end
