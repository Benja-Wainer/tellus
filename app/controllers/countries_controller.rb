class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show world_map ]

  def index
    if params[:query].present?
      @countries = Country.search_by_name(params[:query])
    else
      @countries = Country.all
    end
  end

  def world_map
    @countries = Country.all.map do |country|
      {
        name: country.name,
        id: country.id,
        popup_html: render_to_string(partial: "popup", locals: {country: country})
      }
    end
  end

  def show
    @country = Country.find(params[:id])
    country_search
  end

  def toggle_favorite
    @country = Country.find(params[:id])
    if current_user.favorited?(@country)
      current_user.unfavorite(@country)
    else
      current_user.favorite(@country)
    end
  end

  def news_dataio_secret_key
    ENV["NEWSDATAIO_API_KEY"]
  end

  def country_search
    api_data = { key: news_dataio_secret_key }
    news = RestClient.get("https://newsdata.io/api/1/news?apikey=#{api_data[:key]}&country=#{@country.code}")
    news_array = JSON.parse(news)["results"]

    news_array.each do |s|
      article = Article.create(title: s["title"], date: s["pubDate"], content: s["content"], url: s["link"], source: s["source_id"]["name"], description: s["description"], image_url: s["image_url"])
      Tag.create(country: @country, article: article, topic: Topic.find_by_name(s["category"].first))
    end
  end
end
