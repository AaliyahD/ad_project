class Admin::DashboardController < Admin::ApplicationController


def index
  	@users = User.order(id: :desc).page(params[:page]).first 3
  	@posts = Post.order(id: :desc).page(params[:page]).first 3
  	@diarylogs = Diarylog.order(id: :desc).page(params[:page]).first 3
  	@messages = Message.order(id: :desc).page(params[:page]).first 3
  	@comments = Comment.page(params[:page]).last 2
  
  	@visitors = Visitor.last 5
  end
end



