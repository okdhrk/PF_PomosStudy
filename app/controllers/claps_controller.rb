class ClapsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    clap = current_user.claps.new(tweet_id: tweet.id)
    clap.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    clap = current_user.claps.find_by(tweet_id: tweet.id)
    clap.destroy
    redirect_back(fallback_location: root_path)
  end

end
