class ReservationsController < ApplicationController
  before_action :seance
  before_action :reservation, only: %i[show edit update destroy]

  def index
    @reservations = @seance.reservations
  end

  def new
    @reservation = @seance.reservations.new
  end

  def create
    @reservation = @seance.reservations.new(reservation_params)
    Reservation.transaction do
      @reservation.save!
      create_tickets
    rescue StandardError
      render :new, status: :unprocessable_entity and return
    end
    CreateReservationsJob.perform_later(@reservation)
    redirect_to seances_path, notice: 'Reservation was successfully created.'
  end

  def show; end

  def update
    @reservation.update(status: params[:status])
    redirect_to seance_reservations_path, notice: 'Reservation was successfully updated.'
  end

  private

  def seance
    @seance ||= Seance.find(params[:seance_id])
  end

  def reservation
    @reservation ||= @seance.reservations.find(params[:id])
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
