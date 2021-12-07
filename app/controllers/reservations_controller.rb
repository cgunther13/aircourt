class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true).includes(:vistor, :court,
                                                       :court_reviews, :vistor_reviews, :renter).page(params[:page]).per(10)
  end

  def show
    @vistor_review = VistorReview.new
    @court_review = CourtReview.new
  end

  def new
    @reservation = Reservation.new
  end

  def edit; end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      message = "Reservation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @reservation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Reservation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    message = "Reservation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to reservations_url, notice: message
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :court_id,
                                        :vistor_id)
  end
end
