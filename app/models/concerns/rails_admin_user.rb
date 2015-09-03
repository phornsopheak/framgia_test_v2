module RailsAdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :email
        field :password
        field :password_confirmation
        field :chatwork_id
        field :chatwork_api_key
      end

      list do
        field :name
        field :email
        field :chatwork_api_key
        field :chatwork_id
        field :admin
      end
    end
  end
end

