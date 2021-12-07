class CourtReview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    reservation.to_s
  end

end
