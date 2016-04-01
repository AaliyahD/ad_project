class Admin::UsersController < Admin::ApplicationController
	def index
 if params[:search].present?
  @users = User.where("first_name LIKE ? OR last_name LIKE ? OR location LIKE ? OR hobbies LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
 else
 @users = User.all.order(id: :desc).page params[:page]

end
end



  def show
  	@user = User.find(params[:id])
  	@user_posts = @user.posts
  end
 end

def destroy
  	@user = User.find(params[:id])
  	@user.destroy

if @user.destroy
  	redirect_to admin_user_path, notice: "This user has been successfully deleted"

end
end


