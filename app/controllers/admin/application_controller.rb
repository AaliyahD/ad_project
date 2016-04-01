class Admin::ApplicationController < ActionController::Base

	
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	layout 'admin'

	before_action :authorize
	
	def current_administrator
		@administrator ||= Administrator.find(session[:current_administrator_id]) if session[:current_administrator_id]
	end

	def authorize
		unless current_administrator
			redirect_to '/login', alert: 'Please login to view the admin pages'
end
end

def to_bool string
	#ActiveRecord::Type::Boolean.new.type_cast_from_user(params[:sting])
	ActiveRecord::ConnectionAdapters::Column.value_to_boolean(string)
	end
end
