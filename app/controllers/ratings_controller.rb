class RatingsController < ApplicationController
  def index
    # find_brewery
    # if @brewery
    #   @ratings = @brewery.ratings
    #   @rating = @brewery.ratings.build
    # else
    #   @ratings = Rating.all
    # end



    if params[:brewery_id]
      @brewery = Brewery.find_by(id: params[:brewery_id])
      if @brewery.nil?
        redirect_to breweries_path, alert: "Brewery not found"
      else
        @ratings = @brewery.ratings
      end
    else
      @ratings = Rating.all
    end
  end

  def show
    @brewery = Brewery.find(params[:brewery_id])
    @rating = @brewery.ratings.build
  end

  def new
    find_brewery
    if @brewery
      @rating = @brewery.ratings.build
      render :new_brewery_rating
    else
      @rating = Rating.new
    end
  end

  def create

    find_brewery
    @rating = Rating.new(rating_params)
    if @rating.save
      if @brewery
        redirect_to brewery_path(@brewery)
      else
        redirect_to ratings_path 
      end
    else
      flash.now[:error] = @rating.errors.full_messages
      if @brewery
        render :new_brewery_rating
      else
        render :new
      end
    end
  end

  def edit
    # @rating = Rating.find(params[:id])
    # @brewery = Brewery.find(params[:rating_id])
  end

  def update
  end

  def destroy
  end

  private

  def find_brewery
    if params[:brewery_id]
      @brewery = Brewery.find_by_id(params[:brewery_id])
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :comment, :user_id, :brewery_id, brewery_attributes: [:name, :street, :city, :state, :postal_code, :phone, :website_url])
  end
end
