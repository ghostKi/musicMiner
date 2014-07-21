class FeedController < ApplicationController
  def index
    @articles = Article.scrapped.descendent
    @sources = Source.all
  end

  def show
    @article = Article.find(params[:id])
    @sources = Source.all
  end
end
