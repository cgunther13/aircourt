class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  def index
    @q = Court.ransack(params[:q])
    @courts = @q.result(:distinct => true).includes(:renter, :reservations, :vistors).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@courts.where.not(:location_latitude => nil)) do |court, marker|
      marker.lat court.location_latitude
      marker.lng court.location_longitude
      marker.infowindow "<h5><a href='/courts/#{court.id}'>#{court.renter_id}</a></h5><small>#{court.location_formatted_address}</small>"
    end
  end

  # GET /courts/1
  def show
    @reservation = Reservation.new
  end

  # GET /courts/new
  def new
    @court = Court.new
  end

  # GET /courts/1/edit
  def edit
  end

  # POST /courts
  def create
    @court = Court.new(court_params)

    if @court.save
      message = 'Court was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @court, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /courts/1
  def update
    if @court.update(court_params)
      redirect_to @court, notice: 'Court was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
    message = "Court was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to courts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def court_params
      params.require(:court).permit(:renter_id, :court_type, :directions, :court_rules, :location, :photo, :max_guests)
    end
end
