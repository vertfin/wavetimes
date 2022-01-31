module Wavetimes::Views
  class Text
    def initialize _album
      @album = _album
    end

    def render
      puts @album.to_s
    end
  end
end
