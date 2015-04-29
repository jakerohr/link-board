class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:secret]

  def index
  end

  def about
  end

  def secret
    # @user = current_user

  end


end
