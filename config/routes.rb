Rails.application.routes.draw do
  resources :levels
  resources :courses
  resources :portals
  resources :schools
  root "home#index"
  devise_for :admins, controllers: {
                        registrations: "registrations",
                      }
end
