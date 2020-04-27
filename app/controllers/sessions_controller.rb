class SessionsController < ApplicationController
  #protect_from_forgery with: :null_session

  def create
   # binding.pry
    if auth_hash
   #if request.env["omniauth.auth"].present?
     # user = User.find_or_initialize_by(name: request.env["omniauth.auth"]['info']['name'])
     @user = User.find_or_create_from_auth_hash(auth_hash)
      self.current_user = @user
      redirect_to '/recipes'
    else
      user = User.find_by_name(params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "You have successfully logged in"
      else
       if user
          flash[:alert] = "Your password is not correct"
        else 
          flash[:alert] = "The username is invalid"
       end
        render 'new'
      end
    end
  end
  

  def destroy
    session.clear
    redirect_to '/', notice: "You have successfully logged out"
  end
  
  protected 

  def auth_hash
    request.env['omniauth.auth']
  end
end
