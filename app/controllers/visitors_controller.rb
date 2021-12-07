class VisitorsController < ApplicationController
  before_action :set_visitor, only: %i[show edit update destroy]

  def index
    @q = Visitor.ransack(params[:q])
    @visitors = @q.result(distinct: true).includes(:reservations,
                                                   :court_reviews, :courts_played_at).page(params[:page]).per(10)
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @visitor = Visitor.new
  end

  def edit; end

  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.save
      redirect_to @visitor, notice: "Visitor was successfully created."
    else
      render :new
    end
  end

  def update
    if @visitor.update(visitor_params)
      redirect_to @visitor, notice: "Visitor was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @visitor.destroy
    redirect_to visitors_url, notice: "Visitor was successfully destroyed."
  end

  private

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end

  def visitor_params
    params.require(:visitor).permit(:email, :password, :username,
                                    :first_name, :last_name, :sports_interests)
  end
end
