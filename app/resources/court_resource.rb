class CourtResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :renter_id, :integer
  attribute :court_type, :string_enum, allow: Court.court_types.keys
  attribute :directions, :string
  attribute :court_rules, :string
  attribute :location, :string
  attribute :photo, :string
  attribute :max_guests, :integer

  # Direct associations

  belongs_to :renter

  # Indirect associations

end
