module RailsAdminSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :number_of_question
        field :duration
      end

      list do
        field :name
        field :number_of_question
        field :duration
        field :created_at
      end
    end
  end
end
