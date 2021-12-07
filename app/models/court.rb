class Court < ApplicationRecord
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
