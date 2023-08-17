class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show world_map ]

  def index
    if params[:query].present?
      @countries = Country.search_by_name(params[:query])
      raise
    else
      @countries = Country.all
    end
  end

  def world_map
    @countries = Country.all
    @country_names = []
    @countries.each do |country|
      @country_names << country.name
    end
    @country_names.sort!
  end

  def show
    @country = Country.find(params[:id])
  end

  def toggle_favorite
    @country = Country.find(params[:id])
    if current_user.favorited?(@country)
      current_user.unfavorite(@country)
    else
      current_user.favorite(@country)
    end
  end
end
