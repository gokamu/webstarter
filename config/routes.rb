Rails.application.routes.draw do
  resources :subjects
  resources :courses
  resources :portals, only: [:show]
  resources :schools
  root "home#index"
  devise_for :admins, controllers: {
             registrations: "registrations",
           }
end
