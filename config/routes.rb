Rails.application.routes.draw do
  resources :portals, only: [:show]
  resources :schools
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
