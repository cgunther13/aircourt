class Renter < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :presence => true

  # Scopes

  def to_s
    email
  end

end
