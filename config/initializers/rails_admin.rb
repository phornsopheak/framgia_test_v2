require Rails.root.join("lib", "rails_admin", "request_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RequestQuestion)
require Rails.root.join("lib", "rails_admin", "mark_exam.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::MarkExam)

RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["Exam"]
    end
    export
    bulk_delete
    mark_exam
    show
    edit
    delete
    show_in_app
    request_question
  end
  config.excluded_models = ["Answer", "Option", "Result"]
end
