require "custom_domain"

Rails.application.routes.draw do
  constraints CustomDomain do
    root to: "schools#show" do
      get "admin", to: "admins#show"
      devise_scope :student do
        get "students/sign_in", to: "students/sessions#new"
        get "students/sign_out", to: "students/sessions#destroy"
      end
      devise_scope :teacher do
        get "teachers/sign_in", to: "teachers/sessions#new"
        get "teachers/sign_out", to: "teachers/sessions#destroy"
      end
      resources :blogs
      resources :grades, only: [:edit, :create, :destroy, :update, :show] do
        resources :courses, only: [:show] do
          member do
            get :followers, :course_teachers
          end
        end
        member do
          get :grade_teachers
        end
      end
      resources :students, only: [:show] do
        member do
          get :following
        end
      end
      resources :teachers, only: [:show] do
        member do
          get :grade_taught, :course_taught
        end
      end
    end
  end

  devise_for :admins, controllers: {
                        registrations: "admins/registrations",
                        sessions: "admins/sessions",
                      }
  devise_for :students, controllers: {
                          registrations: "students/registrations",
                          sessions: "students/sessions",
                        }
  devise_for :teachers, controllers: {
                          registrations: "teachers/registrations",
                          sessions: "teachers/sessions",
                        }
  resources :notes
  resources :tests
  resources :assignments
  resources :test_scores
  resources :assignment_scores
  resources :blogs
  resources :courses, only: [:edit, :create, :destroy, :update]
  resources :schools, except: [:destroy] do
    devise_scope :student do
      get "students/sign_in", to: "students/sessions#new"
      get "students/sign_out", to: "students/sessions#destroy"
    end
    devise_scope :teacher do
      get "teachers/sign_in", to: "teachers/sessions#new"
      get "teachers/sign_out", to: "teachers/sessions#destroy"
    end
    resources :blogs
    resources :grades, only: [:edit, :create, :destroy, :update, :show] do
      resources :courses, only: [:show] do
        member do
          get :followers, :course_teachers
        end
      end
      member do
        get :grade_teachers
      end
    end
    resources :students, only: [:show] do
      member do
        get :following
      end
    end
    resources :teachers, only: [:show] do
      member do
        get :grade_taught, :course_taught
      end
    end
  end

  get "/", to: "home#index"

  resources :admins, :only => [:show] do
    get "/createstudent", to: "admins#create_students"
    get "/createteacher", to: "admins#create_teachers"
    get "/classes", to: "admins#classes"
    get "/posts", to: "admins#posts"
    get "/domain", to: "admins#domain"
  end
  resources :student_courses, only: [:create, :destroy]
  resources :teacher_courses, only: [:create, :destroy]
  resources :teacher_grades, only: [:create, :destroy]
  get "schools/:id/admin", to: "admins#show"
end
