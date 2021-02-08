module ApplicationHelper

  def rating_average(brewery)
    if brewery.ratings.empty?
      "~ / 5.0"
    else
      "%.1f" % brewery.ratings.average(:rating) + " / 5.0" #rounds to nearest tenth place in string form
    end
  end

  def style(phone_number) #styles phone number to include dashes
    if phone_number != ""
      array = phone_number.split("")
      array[0..2].join + "-" + array[3..5].join + "-" + array[6..9].join
    else
      "N/A"
    end
  end
  
  
end
