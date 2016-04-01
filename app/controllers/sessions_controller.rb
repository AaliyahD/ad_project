class SessionsController < Devise::SessionsController

def create
    self.resource = warden.authenticate!(auth_options)
    flash[:alert] = "Welcome back, #{current_user.first_name} !" if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthday, :email, :password, :password_confirmation)


  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthday, :about, :hobbies, :status, :email, :password, :password_confirmation, :current_password)
  end
end

 


