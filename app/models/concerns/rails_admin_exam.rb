module RailsAdminExam
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :subject
        field :status
        field :score
        field :time
        field :user
        field :created_at
      end
    end
  end
end
