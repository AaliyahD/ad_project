class Admin::PostsController < Admin::ApplicationController
  def index
    #byebug 'params[:search]' to get hold of the search value
    #The newest things I create will always be at the top
    if params[:search].present?
      @posts = Post.matching_title_or_content(params[:search]).page params[:page]
    else
    @posts = Post.all.order(id: :desc).page params[:page]
  end
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.administrator_id = current_administrator.id
    
    if @post.save
      redirect_to admin_posts_url, notice: 'Your post was successfully created'
    else
      flash[:alert] = 'There was a problem creating your post'
      render :new
  end
end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_url, notice: "The post was successfully updated"
    else
      flash[:alert] = 'There was a problem updating the post. Please try again.'
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

# redirect back to wherever they came from
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to admin_posts_url, notice: 'Post was successfully deleted'
  end

  private 

  def post_params
    params.require(:post).permit(:id, :image, :title, :content, :publish, tag_ids:[])
end
end