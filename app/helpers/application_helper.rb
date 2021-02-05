module ApplicationHelper
  def rating_average(brewery)
    if brewery.ratings.empty?
      "~ / 5.0"
    else
      "%.1f" % brewery.ratings.average(:rating) + " / 5.0" #rounds to nearest tenth place in string form
    end
  end
  
  
end
