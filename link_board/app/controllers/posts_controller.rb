class PostsController < ApplicationController

  before_action :is_authenticated?

  def index
    @posts = current_user.posts
    @vote = Vote.new
    respond_to do |format|
      format.json{render json:@posts}
      format.xml{render xml:@posts}
      format.html
    end
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(post_params)
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "New Post Created"
      redirect_to root_path
    else
      flash[:danger] = "Post Failed"
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.update(params[:id], post_params)
    redirect_to posts_path
  end

  def destroy
    @post = current_user.posts.destroy(params[:id])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
