module RailsAdminExam
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        filters [:user_id, :subject_id]
        sort_by :created_at
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.name, p.id]}
          end
          hide
        end
        field :subject_id, :enum do
          enum do
            Subject.all.collect {|p| [p.name, p.id]}
          end
          hide
        end
        field :created_at do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].created_at.strftime("%Y-%m-%d %I:%M%p")}",
              href: "exam/#{bindings[:object].id}")
          end
        end
        field :user_column do
          label "User"
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].user.name}",
              href: "user/#{bindings[:object].user_id}")
          end
        end
        field :column_subject do
          label "Subject"
        end
        field :score_exam do
          label "Score"
        end
        field :status do
          pretty_value do
            status = bindings[:object]
            class_label = if status.start?
              "label label-primary"
            elsif status.testing?
              "label label-warning"
            elsif status.unchecked?
              "label label-info"
            else
              "label label-success"
            end

            %{<div class="#{class_label}">#{status.status}</div >}.html_safe
          end
        end
        field :mark_exam do
          label ""
          formatted_value do
            if bindings[:object].checked? || bindings[:object].unchecked?
              bindings[:view].content_tag(:a, "<p class='label label-primary'><b>Mark</b></p>".html_safe,
                href: "exam/#{bindings[:object].id}/mark_exam")
            end
          end
        end
      end
    end
  end
end
