class Court < ApplicationRecord
  enum court_type: {"tennis_basketball_baseball_swimming"=>0} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    renter.to_s
  end

end
