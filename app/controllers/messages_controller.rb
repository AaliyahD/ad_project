class MessagesController < ApplicationController
  
  def index
 #get all the logs from the databse and display in the diarylog instance variable.
    @messages = Message.all.order(id: :desc).page params[:page]
end

  def new

  	  @message = Message.new
  end


 def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    
    if @message.save
      redirect_to messages_url, notice: 'Your message was successfully created'
    else
      flash[:alert] = 'There was a problem creating your message'
      render :new
  end
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
  @message.destroy

  redirect_to :back, notice: "The message has been deleted"
end 

private
def message_params
  params.require(:message).permit(:id, :content, :subject, :response, :user_id)

end
end

