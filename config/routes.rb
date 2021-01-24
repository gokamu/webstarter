Rails.application.routes.draw do
  devise_for :students, controllers: {
                          registrations: "students/registrations",
                        }
  devise_for :teachers, controllers: {
                          registrations: "teachers/registrations",
                        }
  resources :notes
  resources :schools
  get "/admin", to: "admins#show"
  get "/classes", to: "admins#classes"
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
      get :followers, :course_teachers
    end
  end
  resources :teachers do
    member do
      get :grade_taught, :course_taught
    end
  end

  resources :grades do
    member do
      get :grade_teachers
    end
  end

  get "/createstudent", to: "admins#create_students"
  get "/createteacher", to: "admins#create_teachers"
  resources :student_courses, only: [:create, :destroy]
  resources :teacher_courses, only: [:create, :destroy]
  resources :teacher_grades, only: [:create, :destroy]
end
