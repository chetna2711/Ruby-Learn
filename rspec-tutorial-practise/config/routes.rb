Rails.application.routes.draw do
  devise_for :students

  root 'students#index'
  resources :students
end
