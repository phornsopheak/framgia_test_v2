module RailsAdminExam
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :subject
        field :status
        field :score_exam do
          label "Score"
        end
        field :time
        field :user
        field :created_at
      end
    end
  end
end
