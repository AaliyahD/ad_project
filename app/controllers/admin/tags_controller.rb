#Add Admin at the top to make sure everything is pasword protected
class Admin::TagsController < Admin::ApplicationController
 def index
        @tags = Tag.all.order(id: :desc).page params[:page]
  end

  def new
    @tag = Tag.new


  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'The tag was successfully created'

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
     @tag = Tag.find(params[:id])
     if @tag.update tags_params
      redirect_to new_admin_tag_url, notice: 'The tag has been successfully updated'
      else
        flash[:alert] = 'There was a problem updating the tag'
        render :edit
    end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to :back, notice: 'The tag has been successfully deleted'
  end

  private

  def tags_params
    params.require(:tag).permit(:id, :name)
end
end
