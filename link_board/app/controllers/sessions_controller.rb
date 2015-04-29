class SessionsController < ApplicationController
  # before_filter :find_model



  def new

  end

  def create
       @user = User.authenticate(params[:user][:name], params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:error] = "Credentials Invalid!!"
      render :new
    end
  end

  def destroy

  end

  # private
  # def find_model
  #   @model = Sessions.find(params[:id]) if params[:id]
  # end
end
