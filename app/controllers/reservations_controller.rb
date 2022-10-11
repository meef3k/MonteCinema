class ReservationsController < ApplicationController
  before_action :seance
  before_action :reservation, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[new create]

  def index
    @reservations = @seance.reservations
    authorize @reservations
  end

  def new
    @reservation = @seance.reservations.new
    authorize @reservation
  end

  def edit
    authorize @reservation
  end

  def create
    @reservation = @seance.reservations.new(email: reservation_params[:email], status: :booked)
    authorize @reservation
    render :new, status: :unprocessable_entity and return unless reservation_closed?

    Reservation.transaction do
      @reservation.save!
      create_tickets
    rescue StandardError
      render :new, status: :unprocessable_entity and return
    end
    CreateReservationsJob.perform_later(@reservation)
    redirect_to seances_path, notice: 'Reservation was successfully created.'
  end

  def create_offline
    @reservation = @seance.reservations.new(email: reservation_params[:email], status: :accepted)
    authorize @reservation

    Reservation.transaction do
      @reservation.save!
      create_tickets
    rescue StandardError
      render :new, status: :unprocessable_entity and return
    end
    redirect_to seances_path, notice: 'Reservation was successfully created.'
  end

  def show
    authorize @reservation
  end

  def update
    @reservation.update(status: params[:status])
    authorize @reservation
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

  def after_time?
    seance.starts_at <= Time.zone.now + 30.minutes
  end

  def reservation_closed?
    return true unless after_time?

    @reservation.errors.add(:reservations_closed, 'Please make reservation at ticket desk')
    false
  end
end
