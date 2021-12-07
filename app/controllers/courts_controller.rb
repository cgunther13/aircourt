class CourtsController < ApplicationController
  before_action :set_court, only: %i[show edit update destroy]

  def index
    @q = Court.ransack(params[:q])
    @courts = @q.result(distinct: true).includes(:renter, :reservations,
                                                 :vistors).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@courts.where.not(location_latitude: nil)) do |court, marker|
      marker.lat court.location_latitude
      marker.lng court.location_longitude
    end
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @court = Court.new
  end

  def edit; end

  def create
    @court = Court.new(court_params)

    if @court.save
      message = "Court was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @court, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @court.update(court_params)
      redirect_to @court, notice: "Court was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @court.destroy
    message = "Court was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to courts_url, notice: message
    end
  end

  private

  def set_court
    @court = Court.find(params[:id])
  end

  def court_params
    params.require(:court).permit(:renter_id, :court_type, :directions,
                                  :court_rules, :location, :photo, :max_guests)
  end
end
