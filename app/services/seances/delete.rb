module Seances
  class Delete
    def initialize(seance_id:)
      @seance_id = seance_id
    end

    def call
      seance.destroy
    end

    private

    attr_reader :seance_id

    def seance
      Seance.find(seance_id)
    end
  end
end
