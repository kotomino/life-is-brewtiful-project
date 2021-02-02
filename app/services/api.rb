require "json"
require "rest-client"

class Api < ApplicationRecord

  URL= "https://api.openbrewerydb.org/breweries"

  def self.load_breweries
    page_number = 1

    while page_number < 403
      response = RestClient.get(URL + "?page=#{page_number}")
      data = JSON.parse(response.body)
      data.each do |brewery_data|
        Brewery.create_or_find_by(
          name: brewery_data["name"],
          street: brewery_data["street"],
          city: brewery_data["city"],
          state: brewery_data["state"],
          postal_code: brewery_data["postal_code"],
          phone: brewery_data["phone"],
          website_url: brewery_data["website_url"]
        )
      end
      page_number +=1
    end
  end

end