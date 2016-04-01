#The <hr> horizantal rule helps to display better, in vistor/index.html.erb
class Admin::VisitorsController < Admin::ApplicationController
  def index
  	@visitors = Visitor.all.order(id: :desc).page params[:page]
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy

  	redirect_to :back, notice: "This user has been successfully deleted"
  end
end
