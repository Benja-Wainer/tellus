class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def refresh_pins
    sleep 0.1
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/sidebar", formats: [:html] }
    end
  end
end
