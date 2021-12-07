class Api::V1::RentersController < Api::V1::GraphitiController
  def index
    renters = RenterResource.all(params)
    respond_with(renters)
  end

  def show
    renter = RenterResource.find(params)
    respond_with(renter)
  end

  def create
    renter = RenterResource.build(params)

    if renter.save
      render jsonapi: renter, status: 201
    else
      render jsonapi_errors: renter
    end
  end

  def update
    renter = RenterResource.find(params)

    if renter.update_attributes
      render jsonapi: renter
    else
      render jsonapi_errors: renter
    end
  end

  def destroy
    renter = RenterResource.find(params)

    if renter.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: renter
    end
  end
end
