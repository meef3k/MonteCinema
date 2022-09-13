class SeancesController < ApplicationController
  # GET /seances or /seances.json
  def index
    @seances = Seance.includes(:movie, :hall).all
  end
  # GET /seances/new
  def new
    @seance = Seance.new
    @halls = Hall.all
    @movies = Movie.all
  end
  # POST /seances or /seances.json
  def create
    @seance = Seance.new(seance_params)

    respond_to do |format|
      if @seance.save
        format.html { redirect_to seance_url(@seance), notice: "Seance was successfully created." }
        format.json { render :show, status: :created, location: @seance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
  end
end