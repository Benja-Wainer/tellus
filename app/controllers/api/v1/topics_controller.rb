class Api::V1::TopicsController < Api::V1::BaseController
  before_action :set_topic, only: [ :show ]

  def show
  end

  def index
    @topics = policy_scope(Topic)
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
    authorize @topic
  end
end
