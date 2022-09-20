class SeancesController < ApplicationController
  # GET /seances
  def index
    @movies = Movie.today
  end

  # GET /seances/new
  def new
    @seance = Seance.new
    @halls = Hall.all
    @movies = Movie.all
  end

  # POST /seances
  def create
    @seance = Seance.new(seance_params)
    @halls = Hall.all
    @movies = Movie.all
    respond_to do |format|
      if @seance.save
        format.html { redirect_to seances_url(@seance), notice: 'Seance was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_seance
    @seance = Seance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def seance_params
    params.require(:seance).permit(:starts_at, :finishes_at, :price, :hall_id, :movie_id)
  end
end
