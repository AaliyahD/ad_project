class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
 
   
  	if params[:tag]
  		@posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
  	else
  	@posts = Post.where(publish: true).order(id: :desc).page(params[:page]).per(Setting.post_per_page)
      end     
end



  def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id

  if @post.save
    redirect_to post_path(@post), notice: 'Post was successfuly created!'
  else
    flash[:alert] = 'There was a problem creating this post'
    render :new
  end
  end

 def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, notice: "The post was successfully updated"
    else
      flash[:alert] = 'There was a problem updating the post. Please try again.'
      render :edit
    end
  end

  def show
  	@post = Post.find(params[:id])
    #form that submits data to two different models. Visitor & comment
    #@visitor = Visitor.new(fullname: 'John', comments: [Comment.new(message: 'not working')])
  	@visitor_comment = Visitor.new(comments: [Comment.new])
    @user_comment = User.new(comments: [Comment.new])

    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    else
    @posts = Post.where(publish: true).order(id: :desc).page(params[:page]).per(Setting.post_per_page)
      end     
end


def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :back, notice: 'Post was successfully deleted'
end

  private 

  def post_params
    params.require(:post).permit(:id, :image, :image, :title, :content, :publish, tag_ids: [])
end 

  def find_post
      @post = Post.find(params[:id])
end

end
