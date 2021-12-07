class Renter < ApplicationRecord
  # Direct associations

  has_many   :courts,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :email, :uniqueness => true

  validates :email, :presence => true

  validates :password, :presence => true

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Scopes

  def to_s
    email
  end

end
