class TweetsController < ApplicationController

  def index
    @user = current_user
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids])
    @tweet = Tweet.new(params[:id])
  end

  def new
    @tweet = Tweet.new
    @user = current_user
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def show
    @tweets = Tweet.find(params[:id])
    @user = @tweets.user
    @tweet_comment =TweetComment.new
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
