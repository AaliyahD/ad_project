class Admin::SessionsController < Admin::ApplicationController
	before_action :authorize, except: [:new, :create]
  def new
      redirect_to admin_dashboard_index_url if current_administrator
  end

  def create

      @administrator = Administrator.find_by(username: params[:username]).try(:authenticate, params[:password])
    	if @administrator 
          	session[:current_administrator_id] = @administrator.id
            redirect_to admin_dashboard_index_url, notice: 'You have logged in successfully.'
        else
            flash[:alert] = 'Invalid login/password combination. Please try again.'
            render :new
        end
    end

    def destroy
    	session[:current_administrator_id] = nil
    	redirect_to '/login', notice: 'You have logged out successfully'

   end
end