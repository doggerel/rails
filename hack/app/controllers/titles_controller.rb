class TitlesController < ApplicationController
  respond_to :html, :js, :json, :xml
  def index
    @search = Post.search do
      fulltext params[:search]
    end
    @post = @search.results
    #render :js => "window.location = '/layouts/application'"
  end
end

