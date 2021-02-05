class BreweriesController < ApplicationController

  def index
    if params[:query]
      @breweries = Brewery.search(params[:query]).page(params[:page])
    else
      @breweries = Brewery.all.page(params[:page])
    end
  end

  def top100
    @breweries = Brewery.top100
  end

  private

  def brewery_params
    params.require(:brewery).permit(
      :name, :street, :city, :state, :postal_code, :phone, :website_url,
      ratings_attributes: [:rating, :comment]
    )
  end
end
