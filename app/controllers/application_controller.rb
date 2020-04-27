class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_user=
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  def authorized
    redirect_to login_path, alert: "You cannot access this page" unless logged_in? && current_user.id == params[:id].to_i 
  end

  def find_by_id(class_name)
    class_name.find_by(id: params[:id])
  end

end
