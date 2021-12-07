class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(:distinct => true).includes(:vistor, :court, :court_reviews, :vistor_reviews, :renter).page(params[:page]).per(10)
  end

  # GET /reservations/1
  def show
    @vistor_review = VistorReview.new
    @court_review = CourtReview.new
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      message = 'Reservation was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @reservation, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    message = "Reservation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to reservations_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :court_id, :vistor_id)
    end
end
