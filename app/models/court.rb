require 'open-uri'
class Court < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :photo, PhotoUploader

  enum court_type: {"tennis_basketball_baseball_swimming"=>0} 

  # Direct associations

  has_many   :reservations,
             :dependent => :destroy

  belongs_to :renter

  # Indirect associations

  has_many   :vistors,
             :through => :reservations,
             :source => :vistor

  # Validations

  validates :court_type, :presence => true

  validates :location, :presence => true

  validates :max_guests, :numericality => { :greater_than => 0 }

  # Scopes

  def to_s
    renter.to_s
  end

end
