module RailsAdminQuestion
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        scopes [nil, :systems, :suggestion, :waiting, :rejected]
        field :content
        field :subject
        field :question_type
        field :user
        field :active_question do
          label "Active"
        end
        field :created_at
      end
    end
  end
end
