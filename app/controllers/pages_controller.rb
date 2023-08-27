class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @country = Country.all.sample(1)
    @countries_info = get_country_info(@country)
  end

  def refresh_pins
    sleep 0.1
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/sidebar", formats: [:html] }
    end
  end

  def get_country_info(country)
    require 'net/http'
    require 'json'

    # Wikipedia API endpoint
    base_url = "https://en.wikipedia.org/w/api.php"

    # Parameters for the API call
    params = {
      action: "query",
      format: "json",  # Response format
      titles: country[0].name, # Replace with the title you're searching for
      prop: "extracts",  # Get content
      exintro: true,  # Only the introduction part
      explaintext: true,  # Plain text content
    }

    # Build the URL with parameters
    url = URI("#{base_url}?#{URI.encode_www_form(params)}")

    # Make the API request
    response = Net::HTTP.get_response(url)

    # Parse the JSON response
    data = JSON.parse(response.body)

    # Extract and print the content
    page_id = data["query"]["pages"].keys.first
    content = data["query"]["pages"][page_id]["extract"]
    content
  end
end
