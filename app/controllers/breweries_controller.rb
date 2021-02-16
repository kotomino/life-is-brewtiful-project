class BreweriesController < ApplicationController

  def index
    if params[:query] #if search field is filled in, show results only
      @breweries = Brewery.search(params[:query]).page(params[:page])
    else #no search; show all breweries
      @breweries = Brewery.all.page(params[:page])
    end
  end

  def top100
    @breweries = Brewery.top100
  end

  private

  def brewery_params #not used currently, but may need if adding additional routes in the future.
    params.require(:brewery).permit(
      :name, :street, :city, :state, :postal_code, :phone, :website_url,
      ratings_attributes: [:rating, :comment]
    )
  end
end
