Rails.application.routes.draw do
  resources :grades
  devise_for :students, controllers: {
                          registrations: "students/registrations",
                        }
  devise_for :teachers, controllers: {
                          registrations: "teachers/registrations",
                        }
  resources :notes
  resources :portals
  resources :schools
  get "/admin", to: "admins#show"
  get "/grades", to: "admins#grades"
  get "/schoolcourses", to: "admins#school_courses"
  root "home#index"
  devise_for :admins, controllers: {
                        registrations: "registrations",
                      }
  resources :admins, :only => [:show]
  resources :students do
    member do
      get :following
    end
  end
  resources :courses do
    member do
      get :followers
    end
  end
  get "/createstudent", to: "admins#create_students"
  get "/createteacher", to: "admins#create_teachers"
end
