class Reservation < ApplicationRecord
  # Direct associations

  belongs_to :court

  belongs_to :vistor,
             :class_name => "Visitor"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    start_time
  end

end
