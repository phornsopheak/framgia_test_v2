require Rails.root.join("lib", "rails_admin", "request_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RequestQuestion)
require Rails.root.join("lib", "rails_admin", "mark_exam.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::MarkExam)
require Rails.root.join("lib", "rails_admin", "edit_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::EditQuestion)
require Rails.root.join("lib", "rails_admin", "create_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::CreateQuestion)
require Rails.root.join("lib", "rails_admin", "show_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ShowQuestion)


RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.actions do
    dashboard
    index
    create_question do
      only Question
    end
    new do
      except ["Exam", "Question"]
    end
    export
    bulk_delete
    mark_exam
    show_question
    show do
      except Question
    end
    edit_question
    edit do
      except Question
    end
    delete
    show_in_app do
      except User
    end
    request_question
  end
  config.excluded_models = ["Answer", "Option", "Result"]
end
