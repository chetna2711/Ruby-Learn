require 'sidekiq/web'

Rails.application.routes.draw do
  
  # devise_for :students
# mount Sidekiq::Web => '/sidekiq'
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions'
  }
  scope :main do
    resources :students do
      collection do
        get :fetch_country_states
        post :upload_csv
      end
    end
  end

  root 'students#index'
mount Sidekiq::Web => '/sidekiq'


end
