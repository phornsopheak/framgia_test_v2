module RailsAdminQuestion
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        scopes [nil, :systems, :suggestion, :waiting, :rejected]
        filters [:subject_id]
        field :content do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].content}" ,
              href: "/admin/question/#{bindings[:object].id}/show_question")
          end
        end
        field :subject_id, :enum do
          enum do
            Subject.all.collect {|p| [p.name, p.id]}
          end
          hide
        end
        field :user_column do
          label "User"
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].user.name}",
              href: "user/#{bindings[:object].user_id}")
          end
        end
        field :created_at do
          filterable false
        end
        field :user do
          hide
        end
        field :active_question do
          label "Active"
        end
      end
    end
  end
end
