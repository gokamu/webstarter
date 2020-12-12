class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :usertype)
  end

  def account_update_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :current_password)
  end
end
