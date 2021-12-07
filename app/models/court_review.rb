class CourtReview < ApplicationRecord
  # Direct associations

  belongs_to :reservation

  # Indirect associations

  has_one    :vistor,
             :through => :reservation,
             :source => :vistor

  # Validations

  validates :body, :presence => true

  validates :score, :numericality => { :less_than_or_equal_to => 10, :greater_than_or_equal_to => 1 }

  # Scopes

  def to_s
    reservation.to_s
  end

end
