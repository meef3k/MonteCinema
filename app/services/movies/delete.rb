module Movies
  class Delete
    def initialize(movie_id:)
      @movie_id = movie_id
    end

    def call
      movie.destroy
    end

    private

    attr_reader :movie_id

    def movie
      Movie.find(movie_id)
    end
  end
end
