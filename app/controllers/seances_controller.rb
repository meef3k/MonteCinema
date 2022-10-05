class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show edit update destroy]
  before_action :halls, only: %i[new show create edit update]
  before_action :movies, only: %i[new show create edit update]
  before_action :today_movies, only: :index

  def index; end

  def show; end

  def new
    @seance = Seance.new
  end

  def create
    @seance = Seance.new(seance_params)
    respond_to do |format|
      if @seance.save
        format.html { redirect_to seances_url(@seance), notice: 'Seance was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @seance.update(seance_params)
        format.html { redirect_to seance_url(@seance), notice: 'Seance was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @seance.destroy

    respond_to do |format|
      format.html { redirect_to seances_url, notice: 'Seance was successfully destroyed.' }
    end
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def seance_params
    params.require(:seance).permit(:starts_at, :finishes_at, :price, :hall_id, :movie_id)
  end

  def halls
    @halls ||= Hall.all
  end

  def movies
    @movies ||= Movie.all
  end

  def today_movies
    @today_movies ||= Movie.today
  end
end
