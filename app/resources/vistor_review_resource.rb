class VistorReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reservation_id, :integer
  attribute :body, :string
  attribute :score, :integer

  # Direct associations

  belongs_to :reservation

  # Indirect associations

  has_one    :renter

  filter :court_id, :integer do
    eq do |scope, value|
      scope.eager_load(:renter).where(:reservations => {:court_id => value})
    end
  end
end
