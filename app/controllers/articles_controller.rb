class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
