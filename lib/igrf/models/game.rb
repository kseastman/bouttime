module IGRF::Models
  class Game
    attr_reader :workbook

    def initialize(file)
      @workbook = RubyXL::Parser.parse(file)
    end

    def jams
      @jams ||= Jam.for(self)
    end
  end
end
