class VotesController < ApplicationController
  # before_filter :find_model

  def create
    if params.key?(:comment_id)
      thing = Comment.find_by_id(params[:comment_id])
    elsif params.key?(:post_id)
      thing = Post.find_by_id(params[:post_id])
    elsif params.key?(:user_id)
      thing = User.find_by_id(params[:user_id])

    else
      return render plain: "invalid input."
    end

    my_vote = thing.votes.find_by_user_id(current_user.id)
    # if there is no vote from this user yet
    if my_vote.nil?
      # create a vote
      current_user.ratings << thing.votes.create(vote_params)
    else
      if(params[:vote][:value].to_i != my_vote.value)
        my_vote.value = params[:vote][:value]
        my_vote.save
      else
        flash[:danger] = "You already voted on that!"
      end
    end
    if params.key?(:comment_id)
      redirect_to post_comments_path

    else
      respond_to do |format|
        format.json{render json:{result:true,vote:thing.votes}}
        format.html{redirect_to root_path}
      end
   end
    # render json: thing

    # redirect_to root_pathZ

  end



  private
  def vote_params
    params.require(:vote).permit(:value)
  end
  def post_params
    params.require(:post).permit(:title, :link, :id)
  end
end
