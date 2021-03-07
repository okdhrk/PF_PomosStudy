class TweetCommentsController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    comment = current_user.tweet_comments.new(tweet_comment_params)
    comment.tweet_id = @tweet.id
    comment.save
    redirect_to tweet_path(@tweet)
  end

  # 未完成
  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    tweet_comment = @tweet.tweet_comments.find(params[:id])
    tweet_comment.destroy
    redirect_to tweet_path(@tweet)
  end


  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end

end
