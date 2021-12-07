class Api::V1::CourtsController < Api::V1::GraphitiController
  def index
    courts = CourtResource.all(params)
    respond_with(courts)
  end

  def show
    court = CourtResource.find(params)
    respond_with(court)
  end

  def create
    court = CourtResource.build(params)

    if court.save
      render jsonapi: court, status: 201
    else
      render jsonapi_errors: court
    end
  end

  def update
    court = CourtResource.find(params)

    if court.update_attributes
      render jsonapi: court
    else
      render jsonapi_errors: court
    end
  end

  def destroy
    court = CourtResource.find(params)

    if court.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: court
    end
  end
end
