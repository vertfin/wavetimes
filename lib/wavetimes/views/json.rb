module Wavetimes::Views
  class Json
    def initialize _album
      @album = _album
    end

    def render
      puts @album.to_json
    end
  end
end
