require Rails.root.join("lib", "rails_admin", "request_question.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RequestQuestion)

RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    request_question
  end
end
