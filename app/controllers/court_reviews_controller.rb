class CourtReviewsController < ApplicationController
  before_action :set_court_review, only: %i[show edit update destroy]

  def index
    @q = CourtReview.ransack(params[:q])
    @court_reviews = @q.result(distinct: true).includes(:reservation,
                                                        :vistor).page(params[:page]).per(10)
  end

  def show; end

  def new
    @court_review = CourtReview.new
  end

  def edit; end

  def create
    @court_review = CourtReview.new(court_review_params)

    if @court_review.save
      message = "CourtReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @court_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @court_review.update(court_review_params)
      redirect_to @court_review,
                  notice: "Court review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @court_review.destroy
    message = "CourtReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to court_reviews_url, notice: message
    end
  end

  private

  def set_court_review
    @court_review = CourtReview.find(params[:id])
  end

  def court_review_params
    params.require(:court_review).permit(:reservation_id, :body, :score)
  end
end
