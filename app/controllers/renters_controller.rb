class RentersController < ApplicationController
  before_action :set_renter, only: %i[show edit update destroy]

  def index
    @q = Renter.ransack(params[:q])
    @renters = @q.result(distinct: true).includes(:courts, :vistor_reviews,
                                                  :reservations).page(params[:page]).per(10)
  end

  def show
    @court = Court.new
  end

  def new
    @renter = Renter.new
  end

  def edit; end

  def create
    @renter = Renter.new(renter_params)

    if @renter.save
      redirect_to @renter, notice: "Renter was successfully created."
    else
      render :new
    end
  end

  def update
    if @renter.update(renter_params)
      redirect_to @renter, notice: "Renter was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @renter.destroy
    redirect_to renters_url, notice: "Renter was successfully destroyed."
  end

  private

  def set_renter
    @renter = Renter.find(params[:id])
  end

  def renter_params
    params.require(:renter).permit(:email, :password, :username, :first_name,
                                   :last_name)
  end
end
