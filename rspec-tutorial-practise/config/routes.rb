Rails.application.routes.draw do
  devise_for :students
  scope :main  do

resources :students do
  collection do
    get :fetch_country_states
  end
end
end
 root 'students#index'
end
