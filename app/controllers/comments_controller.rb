class CommentsController < ApplicationController
before_action :find_post, only: [:edit, :update, :destroy]
before_action :find_comment, only: [:edit, :update, :destroy]
before_action :authenticate_user! , only: [:edit]
	#_comment partial form
	#If I am trying to edit the first comment of a post (which as an ID of 4), the url would be:
	#/messages/4/comments/1
	#comment.message gets /messages/4
	#comment gets /comments/1

    def create
    #finding the post by the message ID
    @post = Post.find(params[:post_id])
    #creating the comment with respect to the post
    @comment = @post.comments.create(comment_params)
        #Creating comment with respect to that user_id
        #@visitor = @comment.visitors.create(visitor_params)
    @comment.user_id = current_user.id
   		 #Creating comment with respect to that visitor_id
    	#@comment.visitor_id = current_visitor_id

    if @comment.save
    	redirect_to post_path(@post), notice: 'Comment was successfuly created!'
    else
    flash[:alert] = 'There was a problem creating this post'
    render :new
  end
    	
    end

 def edit
 	#find the correct post and make it available to the view.
 	#finds all the comments of the message, in particular the one with the corresponding id
 	end

def update
	if @comment.update(comment_params)
		redirect_to post_path(@post), notice: "comment was successfully updated"
	  else 
		flash[:alert]= 'There was a problem with the update'
		render :edit
	end
end
def show
  	@visitor_comment = Visitor.new(comments: [Comment.new])
    @user_comment = User.new(comments: [Comment.new])
  end

def destroy
	@comment.destroy
	redirect_to :back, notice: "The log has been deleted"
end

private

def comment_params
	params.require(:comment).permit(:message)

end
def find_post
	@post = Post.find(params[:post_id])
	
end
def find_comment
	@post = Post.find(params[:post_id])
	#Creatng the comment with respect to the message.
	@comment = @post.comments.find(params[:id])
	#@visitor = @comment.visitors.find(params[:id])
end
end