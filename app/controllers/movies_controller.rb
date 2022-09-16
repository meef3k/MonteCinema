class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movieseances = Seance
                    .where(movie_id: params[:id])
                    .where(starts_at: DateTime.current..Date.today + 7.days)
                    .order(:starts_at)
  end
end
