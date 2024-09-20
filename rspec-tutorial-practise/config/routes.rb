require 'sidekiq/web'

Rails.application.routes.draw do
  root 'students#index'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions'
  }
  resources :students

end


