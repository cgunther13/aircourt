class Visitor < ApplicationRecord
  enum sports_interests: {"tennis_basketball_baseball_swimming"=>0} 

  # Direct associations

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
