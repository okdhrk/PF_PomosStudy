class TweetsController < ApplicationController

  def index
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids])
    @tweets = Tweet.page(params[:page]).per(5).order(created_at: :desc)
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
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @tweet_comment = TweetComment.new
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
