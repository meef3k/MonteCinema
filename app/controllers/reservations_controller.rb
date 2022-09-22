class ReservationsController < ApplicationController
  before_action :set_seance
  def index
    @reservations = @seance.reservations
  end

  private

  def set_seance
    @seance = Seance.find(params[:seance_id])
  end
end
