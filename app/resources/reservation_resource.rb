class ReservationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :start_time, :datetime
  attribute :end_time, :datetime
  attribute :court_id, :integer
  attribute :vistor_id, :integer

  # Direct associations

  # Indirect associations

end
