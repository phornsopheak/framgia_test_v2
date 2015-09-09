module RailsAdminQuestion
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        scopes [nil, :systems, :suggestion, :waiting, :rejected]
        field :content do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].content}" , href: "/admin/question/#{bindings[:object].id}/show_question")
          end
        end
        field :user
        field :created_at
        field :active_question do
          label "Active"
        end
      end
    end
  end
end
