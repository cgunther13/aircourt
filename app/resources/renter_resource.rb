class RenterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_many :courts

  # Indirect associations

  has_many :reservations do
    assign_each do |renter, reservations|
      reservations.select do |r|
        r.id.in?(renter.reservations.map(&:id))
      end
    end
  end

  has_many :vistor_reviews do
    assign_each do |renter, vistor_reviews|
      vistor_reviews.select do |v|
        v.id.in?(renter.vistor_reviews.map(&:id))
      end
    end
  end
end
