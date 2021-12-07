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

  # Indirect associations

end
