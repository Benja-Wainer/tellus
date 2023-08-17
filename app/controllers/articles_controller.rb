class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    if @article.topics.count.zero?
      @topics = topic_gen.map do |topic_name|
        topic = Topic.create!(name: topic_name)
        tag = Tag.new
        tag.topic = topic
        tag.article = @article
        tag.save!
      end
    end
  end

  private

  def topic_gen
    ChatgptService.call(@article.title + " " + @article.content)
  end
end
