class StudentsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:student).permit(:email, :password, :password_confirmation, :school_id)
  end

  def account_update_params
    params.require(:student).permit(:email, :password, :password_confirmation, :current_password)
  end
end
