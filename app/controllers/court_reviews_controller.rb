class CourtReviewsController < ApplicationController
  before_action :set_court_review, only: [:show, :edit, :update, :destroy]

  # GET /court_reviews
  def index
    @court_reviews = CourtReview.all
  end

  # GET /court_reviews/1
  def show
  end

  # GET /court_reviews/new
  def new
    @court_review = CourtReview.new
  end

  # GET /court_reviews/1/edit
  def edit
  end

  # POST /court_reviews
  def create
    @court_review = CourtReview.new(court_review_params)

    if @court_review.save
      message = 'CourtReview was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @court_review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /court_reviews/1
  def update
    if @court_review.update(court_review_params)
      redirect_to @court_review, notice: 'Court review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /court_reviews/1
  def destroy
    @court_review.destroy
    message = "CourtReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to court_reviews_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court_review
      @court_review = CourtReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def court_review_params
      params.require(:court_review).permit(:reservation_id, :body, :score)
    end
end
