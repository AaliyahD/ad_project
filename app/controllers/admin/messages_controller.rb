class Admin::MessagesController < Admin::ApplicationController

    def index
 if params[:search].present?
  @messages = Message.where("id LIKE ? OR content LIKE ? OR subject LIKE ? ", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
 else
  	@messages = Message.all.order(id: :desc).page params[:page]
    @users = User.all.order(id: :desc).page params[:page]
  end

  end
def new
end

def create
end

def edit
  @message = Message.find(params[:id])
  
end

    def update
        @message = Message.find(params[:id])
      if @message.update(message_params)
        redirect_to admin_messages_path, notice: "Message was successfully updated"
        else 
      flash[:alert]= 'There was a problem with the update'
      render :edit
    end
end

def show
  @message = Message.find(params[:id])
  
end

def destroy
  @message = Message.find(params[:id])
  @diarylog.destroy

  redirect_to :back, notice: "The log has been deleted"
end 

end