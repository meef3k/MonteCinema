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
    if !params[:reservation][:seats].present?
      @reservation.errors.add(:base, 'Choose at least one seat')
      render :new, status: :unprocessable_entity
    else
      @reservation.save
      create_tickets
      redirect_to seances_path
    end
  end

  def show; end

  def update
    @reservation.update(status: params[:reservation][:status])
    redirect_to seance_reservations_path
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

  def create_tickets
    params[:reservation][:seats].each do |seat|
      Ticket.create(reservation_id: @reservation.id, seat:)
    end
  end
end
