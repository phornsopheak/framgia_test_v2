module RailsAdminSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :number_of_question
        field :duration
        field :chatwork_room_id
      end

      list do
        field :name
        field :number_of_question
        field :duration
        field :chatwork_room_id
        field :created_at
      end
    end
  end
end
