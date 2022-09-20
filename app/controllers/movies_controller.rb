class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @seances = Seance
               .where(movie_id: params[:id])
               .this_week
  end
end
