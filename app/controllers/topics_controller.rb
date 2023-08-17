class TopicsController < ApplicationController
  def index
    if params[:query].present?
      @topics = Topic.search_by_name(params[:query])
    else
      @topics = Topic.all
    end
  end

  def toggle_favorite
    @topic = Topic.find(params[:id])
    if current_user.favorited?(@topic)
      current_user.unfavorite(@topic)
    else
      current_user.favorite(@topic)
    end
    # render partial: "shared/sidebar"
  end
end
