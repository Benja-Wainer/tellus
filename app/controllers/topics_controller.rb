class TopicsController < ApplicationController
  def index
    if params[:query].present?
      @topics = Topic.search_by_name(params[:query])
    else
      @topics = Topic.all
    end
  end
end
