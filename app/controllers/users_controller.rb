class UsersController < ApplicationController
  before_action :authorized, except: [:new,:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = find_by_id(User)
  end

  def update
    @user = find_by_id(User)
  end

  def show
    @user = find_by_id(User)
  end

  private 

  def user_params
    params.require(:user).permit(:name,:password)
  end

end
