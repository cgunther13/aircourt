class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update, :destroy]

  # GET /renters
  def index
    @renters = Renter.page(params[:page]).per(10)
  end

  # GET /renters/1
  def show
    @court = Court.new
  end

  # GET /renters/new
  def new
    @renter = Renter.new
  end

  # GET /renters/1/edit
  def edit
  end

  # POST /renters
  def create
    @renter = Renter.new(renter_params)

    if @renter.save
      redirect_to @renter, notice: 'Renter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /renters/1
  def update
    if @renter.update(renter_params)
      redirect_to @renter, notice: 'Renter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /renters/1
  def destroy
    @renter.destroy
    redirect_to renters_url, notice: 'Renter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_renter
      @renter = Renter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def renter_params
      params.require(:renter).permit(:email, :password, :username, :first_name, :last_name)
    end
end
