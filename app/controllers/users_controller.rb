class UsersController < ApplicationController
 def index
 if params[:search].present?
 	@users = User.where("first_name LIKE ? OR last_name LIKE ? OR location LIKE ? OR hobbies LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
 else
 @users = User.all.order(id: :desc).page params[:page]
end
end


  def show

  	@user = User.find(params[:id]) 
  	@post = Post.find(params[:id])
  		@posts = Post.where(publish: true)
  	@comments = Post.find(params[:id])
 	@visitor_comment = Visitor.new(comments: [Comment.new])
    @user_comment = User.new(comments: [Comment.new])
  	@posts = Post.order(id: :desc).page(params[:page])
  	@comments = Comment.order(id: :desc).page(params[:page]).first 5
  end
end


	

private
def user_params
    params.require(:post).permit(:image)
end 