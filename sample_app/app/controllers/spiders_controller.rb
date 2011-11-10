class SpidersController < ApplicationController
  respond_to :html, :json
  def index 
    @search = User.search do
      fulltext params[:search]
    end
    @spiders = @search.results
    respond_with(@spiders)

  end
end
