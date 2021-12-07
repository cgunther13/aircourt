class VistorReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reservation_id, :integer
  attribute :body, :string
  attribute :score, :integer

  # Direct associations

  # Indirect associations

end
