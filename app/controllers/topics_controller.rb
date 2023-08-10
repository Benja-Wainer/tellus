class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def toggle_favorite
    @topic = Topic.find(params[:id])
    if current_user.favorited?(@topic)
      current_user.unfavorite(@topic)
    else
      current_user.favorite(@topic)
    end
  end
end
