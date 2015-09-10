module RailsAdminSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :number_of_question
        field :duration do
          label "Duration(minute)"
        end
        field :chatwork_room_id
      end

      list do
        field :subject_name do
          label "Name"
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "subject/#{bindings[:object].id}")
          end
        end
        field :number_of_question
        field :duration
        field :chatwork_room_id
        field :created_at
      end
    end
  end
end
