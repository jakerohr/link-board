class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:secret]

  def index
    @posts = Post.all
    @users = User.all
    @vote = Vote.new
    @comments = Comment.all
    respond_to do |format|
      format.json{render json:@posts}
      format.xml{render xml:@posts}
      format.html
    end

    # @posts = current_user.posts
  end

  def about
  end

  def secret
    # @user = current_user

  end


end
