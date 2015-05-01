class CommentsController < ApplicationController
  before_action :is_authenticated?

  # def new
  #   @comment = Comment.new
  #   @post = Post.find(params[:post_id])
  #   @comments = @post.comments
  # end

  def create
    @post = Post.find(params[:post_id])
    current_user.comments << @post.comments.create(comment_params)

    flash[:success] = "New Comment Created"
      redirect_to post_comments_path
    # @comment = current_user.comment.create(comment_params)
    # if @comment.save
    #   flash[:success] = "New Comment Created"
    #   redirect_to post_path(@post)
    # else
    #   flash[:danger] = "Comment Failed"
    #   render :new
    # end
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @vote = Vote.new
    @users = User.all
    @comment = Comment.new

  end


  private
   def comment_params
    params.require(:comment).permit(:body)
  end
  # def find_model
  #   @model = Comments.find(params[:id]) if params[:id]
  # end
end
