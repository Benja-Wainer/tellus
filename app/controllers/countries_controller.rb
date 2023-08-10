class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @countries = Country.all
    @country_names = []
    @countries.each do |country|
      @country_names << country.name
    end
  end

  def show
    @country = Country.find(params[:id])
  end
end
