class Admin::DiarylogsController < Admin::ApplicationController

	def index

params[:search].present?
 	@diarylogs = Diarylog.where('user_id LIKE ?', "%#{params[:search]}%").page params[:page]
 else
 #get all the logs from the databse and display in the diarylog instance variable.
		@diarylogs = Diarylog.all.order(id: :desc).page params[:page]
end
#end

	def new
end

	def create
end

	def edit
		 @diarylog = Diarylog.find(params[:id])
end

    def update
    	     	@diarylog = Diarylog.find(params[:id])
    	if @diarylog.update(diarylog_params)
    		redirect_to admin_diarylogs_path, notice: "diary log was succefully updated"
    		else 
			flash[:alert]= 'There was a problem with the update'
			render :edit
		end
end

def show
	@diarylog = Diarylog.find(params[:id])
	
end

def destroy
	@diarylog = Diarylog.find(params[:id])
	@diarylog.destroy

	redirect_to :back, notice: "The log has been deleted"
end 
private
def diarylog_params
	params.require(:diarylog).permit(:id, :meal_type, :description, :calories, :sugar, :fat, :sodium, :sat_fat, :fiber, :date, :time, :user_id, :carbs, :protein, :feedback)

end
end