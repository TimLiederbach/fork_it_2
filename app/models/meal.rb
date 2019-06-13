require 'open-uri'
class Meal < ApplicationRecord
  before_validation :geocode_image_url

  def geocode_image_url
    if self.image_url.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.image_url)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.image_url_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.image_url_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.image_url_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
