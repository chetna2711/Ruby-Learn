require 'sidekiq/web'

Rails.application.routes.draw do
  root 'students#index'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions'
  }
  scope :main do
    resources :students do
      collection do
        post :upload_csv
      end
    end
  end
end


