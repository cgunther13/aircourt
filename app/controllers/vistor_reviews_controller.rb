class VistorReviewsController < ApplicationController
  before_action :set_vistor_review, only: [:show, :edit, :update, :destroy]

  # GET /vistor_reviews
  def index
    @vistor_reviews = VistorReview.all
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
      redirect_to @vistor_review, notice: 'Vistor review was successfully created.'
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
    redirect_to vistor_reviews_url, notice: 'Vistor review was successfully destroyed.'
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