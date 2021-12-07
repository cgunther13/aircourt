class Reservation < ApplicationRecord
  # Direct associations

  has_many   :vistor_reviews,
             :dependent => :destroy

  has_many   :court_reviews,
             :dependent => :destroy

  belongs_to :court

  belongs_to :vistor,
             :class_name => "Visitor"

  # Indirect associations

  has_one    :renter,
             :through => :court,
             :source => :renter

  # Validations

  # Scopes

  def to_s
    start_time
  end

end
