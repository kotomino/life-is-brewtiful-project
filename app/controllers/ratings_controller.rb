class RatingsController < ApplicationController

  before_action :find_brewery, only: [:index, :new]
  before_action :find_rating, only: [:edit, :update, :destroy]

  def index
    #only nested route exists
    if @brewery.nil?
      redirect_to breweries_path, alert: "Brewery not found"
    else
      @ratings = @brewery.ratings.order_by_date
    end 
  end

  def new
    redirect_if_not_logged_in
    if @brewery
      @rating = @brewery.ratings.build
      render :new_brewery_rating
    else
      @rating = Rating.new
    end
  end

  def create
    @brewery = Brewery.find_by_id(params[:rating][:brewery_id]) # find_brewery does not work; params hash has an extra layer
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    if @rating.save
      if @brewery
        redirect_to brewery_ratings_path(@brewery)
      else
        redirect_to breweries_path
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
    redirect_if_not_logged_in
    redirect_if_not_owner
  end

  def update
    if @rating.update(rating_params)
      flash[:notice] = "Your rating for #{@rating.brewery.name} has been updated."
      redirect_to brewery_ratings_path(@rating.brewery_id)
    else
      flash.now[:error] = @rating.errors.full_messages
      render :edit
    end
  end

  def destroy
    redirect_if_not_owner
    @rating.destroy
    flash.now[:notice] = "Your review was removed."
    redirect_to brewery_ratings_path(@rating.brewery_id)
  end

  def personal_index
    redirect_if_not_logged_in
    @ratings = current_user.ratings
  end

  private

  def find_rating
    @rating = Rating.find_by_id(params[:id])
  end

  def find_brewery
    if params[:brewery_id]
      @brewery = Brewery.find_by_id(params[:brewery_id])
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :comment, :user_id, :brewery_id, 
      brewery_attributes: [:name, :street, :city, :state, :postal_code, :phone, :website_url])
  end
end
