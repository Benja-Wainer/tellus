class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show search_topics]

  def index
    if params[:query].present?
      @topics = Topic.search_by_name(params[:query])
    else
      @topics = Topic.all
    end
  end

  def show
    @topic = Topic.find(params[:id])
    keyword_search
  end

  def search_topics
    if params[:query].present?
      @topic = Topic.create(name: params[:query])
      keyword_searchbar_search(@topic)
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

  def news_dataio_secret_key
    ENV["NEWSDATAIO_API_KEY"]
  end

  private

  def keyword_search
    api_data = { key: news_dataio_secret_key }
    query = @topic.name
    news = RestClient.get("https://newsdata.io/api/1/news?apikey=#{api_data[:key]}&q=#{query}")
    news_array = JSON.parse(news)["results"]

    news_array.each do |s|
      article = Article.create( title: s["title"],
                                date: s["pubDate"],
                                content: s["content"],
                                url: s["link"],
                                source: s["source_id"]["name"],
                                description: s["description"],
                                image_url: s["image_url"])
      # Create a conditional for nil country
      # assigned_country = Country.find_by(name: country_api_name)
      tag = Tag.create(country: Country.find_by(alt: s["country"].first), article: article, topic: @topic)
    end
  end

  def keyword_searchbar_search(topic)
    api_data = { key: news_dataio_secret_key }
    query = topic.name
    news = RestClient.get("https://newsdata.io/api/1/news?apikey=#{api_data[:key]}&q=#{query}")
    news_array = JSON.parse(news)["results"]

    news_array.each do |s|
      article = Article.create( title: s["title"],
                                date: s["pubDate"],
                                content: s["content"],
                                url: s["link"],
                                source: s["source_id"]["name"],
                                description: s["description"],
                                image_url: s["image_url"])
      # Create a conditional for nil country
      # assigned_country = Country.find_by(alt: s["country"])
      Tag.create(country: Country.find_by(alt: s["country"].first), article: article, topic: @topic)
    end
  end
end
