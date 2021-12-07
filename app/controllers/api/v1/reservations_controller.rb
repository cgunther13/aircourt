class Api::V1::ReservationsController < Api::V1::GraphitiController
  def index
    reservations = ReservationResource.all(params)
    respond_with(reservations)
  end

  def show
    reservation = ReservationResource.find(params)
    respond_with(reservation)
  end

  def create
    reservation = ReservationResource.build(params)

    if reservation.save
      render jsonapi: reservation, status: 201
    else
      render jsonapi_errors: reservation
    end
  end

  def update
    reservation = ReservationResource.find(params)

    if reservation.update_attributes
      render jsonapi: reservation
    else
      render jsonapi_errors: reservation
    end
  end

  def destroy
    reservation = ReservationResource.find(params)

    if reservation.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: reservation
    end
  end
end
