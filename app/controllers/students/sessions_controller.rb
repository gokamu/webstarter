# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  protect_from_forgery with: :exception

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_in_path_for(resource)
    school_student_path(current_student.school, current_student)
  end

  def after_sign_out_path_for(resource)
    request.referrer || @student
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
  end
end
