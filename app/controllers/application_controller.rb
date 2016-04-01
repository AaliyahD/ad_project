class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)}
devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :image, :last_name, :username, :birthday, :about, :email, :password, :remember_me)}
end
end

def current_user
  @user ||= User.find(session[:current_user_id]) if session[:current_user_id]
end

def greet
  now = Time.now
  today = Date.today.to_time

  morning = today.beginning_of_day
  noon = today.noon
  evening = today.change( hour: 17 )
  night = today.change( hour: 20 )
  tomorrow = today.tomorrow

  if (morning..noon).cover? now
     flash.now[:alert] = "Good Morning, #{current_user.first_name} Its never too early to work out !"
  elsif (noon..evening).cover? now
    flash.now[:alert] = "Good Afternoon, #{current_user.first_name}. Remember to eat clean" 
  elsif (evening..night).cover? now
    flash.now[:alert] = "Good Evening, #{current_user.first_name}. Hope you had a good a day!"
  elsif (night..tomorrow).cover? now
    flash.now[:alert] = "Its never too late to work out, #{current_user.first_name} !"
  end
end

