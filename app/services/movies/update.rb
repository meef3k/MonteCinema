module Movies
  class Update
    def initialize(movie_id:, params:)
      @movie_id = movie_id
      @params = params
    end

    def call
      movie.update(params)
      movie
    end

    private

    attr_reader :movie_id, :params

    def movie
      @movie ||= Movie.find(movie_id)
    end
  end
end
