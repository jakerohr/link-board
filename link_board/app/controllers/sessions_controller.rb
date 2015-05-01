class SessionsController < ApplicationController
  # before_filter :find_model



  def new

  end

  def create
       @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:danger] = "Credentials Invalid!!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "User has logged out"
    redirect_to login_path
  end

  # private
  # def find_model
  #   @model = Sessions.find(params[:id]) if params[:id]
  # end
end
