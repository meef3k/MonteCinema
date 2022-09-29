module Seances
  class Create
    def initialize(params)
      @params = params
    end

    def call
      Seance.create(params)
    end

    private

    attr_reader :params
  end
end
