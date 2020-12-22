Rails.application.routes.draw do
  devise_for :students, controllers: {
                          students: "registrations",
                        }
  resources :notes
  resources :levels
  resources :courses
  resources :portals
  resources :schools
  root "home#index"
  devise_for :admins, controllers: {
                        registrations: "registrations",
                      }
  resources :admins, :only => [:show]
end
