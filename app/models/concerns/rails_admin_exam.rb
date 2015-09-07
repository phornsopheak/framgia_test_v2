module RailsAdminExam
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :created_at do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].created_at.strftime("%Y-%m-%d %I:%M%p")}",
              href: "exam/#{bindings[:object].id}")
          end
        end
        field :user
        field :column_subject do
          label "Subject"
        end
        field :score_exam do
          label "Score"
        end
        field :status
        field :mark_exam do
          label ""
          formatted_value do
            bindings[:view].content_tag(:a, "<p class='label label-primary'><b>Mark</b></p>".html_safe,
              href: "exam/#{bindings[:object].id}/mark_exam")
          end

          visible do
            authorized?
          end
        end
        field :show do
          hide
        end
      end
    end
  end
end
