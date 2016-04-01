class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
  	else
  	@comments = Comment.where(status: to_bool(params[:status]))
  	@comments = Comment.all.order(id: :desc).page params[:page]
  end
end
  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(status: params[:status])
  		redirect_to :back, notice: 'The comment has been successfully update'
  	else
  		redirect_to :back, notice: 'There was a problem updating the comment.'
end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to :back, notice: 'The comment has been succssfully deleted'
  end
end