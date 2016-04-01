class Admin::AdministratorsController < Admin::ApplicationController
	def index
		@administrators = Administrator.all
end

def edit
	@administrator = Administrator.find(params[:id])
end

def update
@administrator = Administrator.find(params[:id])

if @administrator.update(administrator_params)
	flash[:notice] = "Administrator was successfully updated"
	redirect_to admin_administrators_url
else
	flash[:alert] = "There was a problem updating the administrator. Please try again."
	render 'edit'
end
end

private

def administrator_params
	params.require(:administrator).permit(:id, :fullname, :username, :password)
end
end