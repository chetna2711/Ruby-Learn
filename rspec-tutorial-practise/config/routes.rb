Rails.application.routes.draw do
  # devise_for :students
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions'
  }
  scope :main do
    resources :students do
      collection do
        get :fetch_country_states
      end
    end
  end
  root 'students#index'
end
