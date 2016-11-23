Rails.application.routes.draw do
  resources :courses
  resources :reports
  get 'home/index'
  resources :activate_user

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
