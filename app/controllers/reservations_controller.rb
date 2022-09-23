class ReservationsController < ApplicationController
  before_action :set_seance
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = @seance.reservations
  end

  def new
    @reservation = @seance.reservations.build
  end

  def create
    @reservation = @seance.reservations.build(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to seance_reservations_path(@seance), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_seance
    @seance = Seance.find(params[:seance_id])
  end

  def set_reservation
    @reservation = @seance.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:email, :seance_id)
  end
end
