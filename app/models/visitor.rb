class Visitor < ApplicationRecord
  enum sports_interests: {"tennis_basketball_baseball_swimming"=>0} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

end
