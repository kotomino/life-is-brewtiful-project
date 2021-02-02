class BreweriesController < ApplicationController

  def index
    if params[:query]
      @breweries = Brewery.search(params[:query]).page(params[:page])
    else
      @breweries = Brewery.all.page(params[:page])
    end
  end

  def show
    @brewery = Brewery.find_by_id(params[:id])
  end

  def new
    @brewery = Brewery.new
    @brewery.ratings.build
  end

  def create
    @brewery = Brewery.new(brewery_params)

    if @brewery.save
      redirect_to brewery_path(@brewery)
    else
      render :new
    end
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    find_brewery
    if @brewery.update(brewery_params)
      redirect_to brewery_path(@brewery)
    else
      flash.now[:error] = @brewery.errors.full_messages
      render :edit
    end
  end

  def destroy
    find_brewery
    @brewery.destroy
    flash[:notice] = "#{@brewery.name} was deleted."
    redirect_to breweries_path
  end

  private

  def find_brewery
    @brewery = Brewery.find_by_id(params[:id])
  end



  def brewery_params
    params.require(:brewery).permit(
      :name,
      :street,
      :city,
      :state,
      :postal_code,
      :phone,
      :website_url,
      ratings_attributes: [
        :rating,
        :comment
      ]
    )
  end
end
