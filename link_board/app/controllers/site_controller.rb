class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:secret]

  def index
    @posts = current_user.posts
  end

  def about
  end

  def secret
    # @user = current_user

  end


end
