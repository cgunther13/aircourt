class ReservationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :start_time, :datetime
  attribute :end_time, :datetime
  attribute :court_id, :integer
  attribute :vistor_id, :integer

  # Direct associations

  has_many   :vistor_reviews

  has_many   :court_reviews

  belongs_to :court

  belongs_to :vistor,
             resource: VisitorResource

  # Indirect associations

  has_one    :renter

  filter :renter_id, :integer do
    eq do |scope, value|
      scope.eager_load(:renter).where(:courts => {:renter_id => value})
    end
  end
end
