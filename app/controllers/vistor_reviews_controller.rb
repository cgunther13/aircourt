class VistorReviewsController < ApplicationController
  before_action :set_vistor_review, only: [:show, :edit, :update, :destroy]

  # GET /vistor_reviews
  def index
    @vistor_reviews = VistorReview.page(params[:page]).per(10)
  end

  # GET /vistor_reviews/1
  def show
  end

  # GET /vistor_reviews/new
  def new
    @vistor_review = VistorReview.new
  end

  # GET /vistor_reviews/1/edit
  def edit
  end

  # POST /vistor_reviews
  def create
    @vistor_review = VistorReview.new(vistor_review_params)

    if @vistor_review.save
      message = 'VistorReview was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @vistor_review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /vistor_reviews/1
  def update
    if @vistor_review.update(vistor_review_params)
      redirect_to @vistor_review, notice: 'Vistor review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vistor_reviews/1
  def destroy
    @vistor_review.destroy
    message = "VistorReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to vistor_reviews_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vistor_review
      @vistor_review = VistorReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vistor_review_params
      params.require(:vistor_review).permit(:reservation_id, :body, :score)
    end
end
