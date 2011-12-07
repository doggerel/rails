class TitlesController < ApplicationController
  respond_to :js,:html,:xml,:json
  def index
    @search = Post.search do
      fulltext params[:search]
    end
    @post = @search.results
    respond_with(@post)
  end
end

