module Seances
  class Update
    def initialize(seance_id:, params:)
      @seance_id = seance_id
      @params = params
    end

    def call
      seance.update(params)
      seance
    end

    private

    attr_reader :seance_id, :params

    def seance
      @seance ||= Seance.find(seance_id)
    end
  end
end
