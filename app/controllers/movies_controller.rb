class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @seances = Seance
               .where(movie_id: params[:id])
               .week
  end
end
