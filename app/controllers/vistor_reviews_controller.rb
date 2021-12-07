class VistorReviewsController < ApplicationController
  before_action :set_vistor_review, only: %i[show edit update destroy]

  def index
    @q = VistorReview.ransack(params[:q])
    @vistor_reviews = @q.result(distinct: true).includes(:reservation,
                                                         :renter).page(params[:page]).per(10)
  end

  def show; end

  def new
    @vistor_review = VistorReview.new
  end

  def edit; end

  def create
    @vistor_review = VistorReview.new(vistor_review_params)

    if @vistor_review.save
      message = "VistorReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @vistor_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @vistor_review.update(vistor_review_params)
      redirect_to @vistor_review,
                  notice: "Vistor review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vistor_review.destroy
    message = "VistorReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to vistor_reviews_url, notice: message
    end
  end

  private

  def set_vistor_review
    @vistor_review = VistorReview.find(params[:id])
  end

  def vistor_review_params
    params.require(:vistor_review).permit(:reservation_id, :body, :score)
  end
end
