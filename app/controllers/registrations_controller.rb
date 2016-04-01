class RegistrationsController <  Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthday, :email, :password, :password_confirmation)


  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :image, :username, :birthday, :about, :hobbies, :advice, :height, :starting_weight, :current_weight, :location, :email, :password, :password_confirmation, :current_password)
  end
end