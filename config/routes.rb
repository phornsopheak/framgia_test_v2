Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  root "staticpages#home"
  resources :exams, only: [:index]
end
