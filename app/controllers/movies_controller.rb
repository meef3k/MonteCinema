class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :seances, only: :show
  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = ::Movies::Create.new(movie_params).call

    if @movie.valid?
      redirect_to movie_url(@movie), notice: 'Movie was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @movie = ::Movies::Update.new(movie_id: params[:id], params: movie_params).call

    if @movie.errors.any?
      render :edit, status: :unprocessable_entity
    else
      redirect_to movie_url(@movie), notice: 'Movie was successfully updated'
    end
  end

  def destroy
    ::Movies::Delete.new(movie_id: params[:id]).call

    redirect_to movies_url, notice: 'Movie was successfully deleted'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :duration)
  end

  def seances
    @seances ||= Seance.where(movie_id: params[:id]).this_week
  end
end
