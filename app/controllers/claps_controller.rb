class ClapsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    clap = current_user.claps.new(tweet_id: @tweet.id)
    clap.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    clap = current_user.claps.find_by(tweet_id: @tweet.id)
    clap.destroy
  end

end
