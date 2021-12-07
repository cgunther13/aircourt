class VisitorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :sports_interests, :string_enum, allow: Visitor.sports_interests.keys

  # Direct associations

  has_many   :reservations,
             foreign_key: :vistor_id

  # Indirect associations

  has_many :court_reviews do
    assign_each do |visitor, court_reviews|
      court_reviews.select do |c|
        c.id.in?(visitor.court_reviews.map(&:id))
      end
    end
  end

end
