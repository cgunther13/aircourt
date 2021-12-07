class Api::V1::VisitorsController < Api::V1::GraphitiController
  def index
    visitors = VisitorResource.all(params)
    respond_with(visitors)
  end

  def show
    visitor = VisitorResource.find(params)
    respond_with(visitor)
  end

  def create
    visitor = VisitorResource.build(params)

    if visitor.save
      render jsonapi: visitor, status: :created
    else
      render jsonapi_errors: visitor
    end
  end

  def update
    visitor = VisitorResource.find(params)

    if visitor.update_attributes
      render jsonapi: visitor
    else
      render jsonapi_errors: visitor
    end
  end

  def destroy
    visitor = VisitorResource.find(params)

    if visitor.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: visitor
    end
  end
end
