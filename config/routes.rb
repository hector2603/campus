Rails.application.routes.draw do
  resources :courses
  resources :courses do
    resources :qualifications
    resources :content_courses, only: [:new ,:create, :edit, :update, :destroy]
    resources :asignar_estudiantes
  end
  resources :course_users
  resources :reports
  get 'home/index'
  resources :activate_user

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
