class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movieseances = Seance
                    .where(movie_id: params[:id])
                    .where(starts_at: DateTime.current..7.days.from_now)
                    .order(:starts_at)
  end
end
