class Visitor < ApplicationRecord
  enum sports_interests: {"tennis_basketball_baseball_swimming"=>0} 

  # Direct associations

  has_many   :reservations,
             :foreign_key => "vistor_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :courts_played_at,
             :through => :reservations,
             :source => :court

  has_many   :court_reviews,
             :through => :reservations,
             :source => :court_reviews

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
