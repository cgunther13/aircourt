class Api::V1::VistorReviewsController < Api::V1::GraphitiController
  def index
    vistor_reviews = VistorReviewResource.all(params)
    respond_with(vistor_reviews)
  end

  def show
    vistor_review = VistorReviewResource.find(params)
    respond_with(vistor_review)
  end

  def create
    vistor_review = VistorReviewResource.build(params)

    if vistor_review.save
      render jsonapi: vistor_review, status: :created
    else
      render jsonapi_errors: vistor_review
    end
  end

  def update
    vistor_review = VistorReviewResource.find(params)

    if vistor_review.update_attributes
      render jsonapi: vistor_review
    else
      render jsonapi_errors: vistor_review
    end
  end

  def destroy
    vistor_review = VistorReviewResource.find(params)

    if vistor_review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: vistor_review
    end
  end
end
