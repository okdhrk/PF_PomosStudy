class ClapsController < ApplicationController
  
  def create
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
  end

end
