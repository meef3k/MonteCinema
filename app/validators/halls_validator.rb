class HallsValidator
  def initialize(params:, movie:)
    @params = params
    @movie = movie
  end

  def validate!
    return 'undefined starts_at' unless params[:starts_at]
    return 'hall is taken' if overlaps?

    true
  end

  private

  attr_reader :params, :movie

  def set_finishes_at
    params[:finishes_at] = params[:starts_at] + movie.duration.minutes + ADS_TIME
  end

  def set_time_period
    starts_at..finishes_at
  end

  def overlaps?
    seances.any? do |seance|
      set_time_period.overlaps?(seance.set_time_period)
    end
  end

  def seances
    @seances ||= Seance.where(hall_id: params[:hall_id])
  end
end
