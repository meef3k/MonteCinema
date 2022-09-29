class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show edit update destroy]
  before_action :set_halls, only: %i[new show create edit update]
  before_action :set_movies, only: %i[new show create edit update]
  before_action :today_movies, only: :index

  def index; end

  def show; end

  def new
    @seance = Seance.new
  end

  def edit; end

  def create
    @seance = ::Seances::Create.new(seance_params).call

    if @seance.valid?
      redirect_to seance_url(@seance), notice: 'Seance was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @seance = ::Seances::Update.new(seance_id: params[:id], params: seance_params).call

    if @seance.errors.any?
      render :edit, status: :unprocessable_entity
    else
      redirect_to seance_url(@seance), notice: 'Seance was successfully updated'
    end
  end

  def destroy
    ::Seances::Delete.new(seance_id: params[:id]).call

    redirect_to seances_url, notice: 'Seance was successfully deleted'
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def seance_params
    params.require(:seance).permit(:starts_at, :finishes_at, :price, :hall_id, :movie_id)
  end

  def set_halls
    @halls = Hall.all
  end

  def set_movies
    @movies = Movie.all
  end

  def today_movies
    @movies = Movie.today
  end
end
