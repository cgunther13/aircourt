class Api::V1::CourtReviewsController < Api::V1::GraphitiController
  def index
    court_reviews = CourtReviewResource.all(params)
    respond_with(court_reviews)
  end

  def show
    court_review = CourtReviewResource.find(params)
    respond_with(court_review)
  end

  def create
    court_review = CourtReviewResource.build(params)

    if court_review.save
      render jsonapi: court_review, status: 201
    else
      render jsonapi_errors: court_review
    end
  end

  def update
    court_review = CourtReviewResource.find(params)

    if court_review.update_attributes
      render jsonapi: court_review
    else
      render jsonapi_errors: court_review
    end
  end

  def destroy
    court_review = CourtReviewResource.find(params)

    if court_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: court_review
    end
  end
end
