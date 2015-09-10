module RailsAdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :email
        field :admin
        field :password
        field :password_confirmation
        field :chatwork_id
        field :chatwork_room_id
        field :chatwork_api_key
      end

      list do
        field :user_name do
          label "Name"
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "user/#{bindings[:object].id}")
          end
        end
        field :name do
          hide
        end
        field :email
        field :chatwork_id
        field :chatwork_room_id
        field :chatwork_api_key
        field :admin
      end
    end
  end
end

