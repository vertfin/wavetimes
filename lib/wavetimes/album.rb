class Wavetimes::Album
  attr_accessor :songs, :duration
  attr_accessor :verbose, :artist, :title, :ref

  def initialize a
    glob_path = a.delete(:files) || "*.wav"
    a = {}.merge(a)
    a.each_pair { |k,v| self.send(k.to_s+"=",v) }
    self.songs = []
    files = Dir.glob(glob_path)
    start = 0.0;
    files.sort.each_with_index do |fn,idx|
      song = Song.new(idx: idx, start: start, filename: fn)
      self.songs << song
      start += song.duration.to_f
    end
    return nil if self.songs.length.zero?
    self.duration = Wavetimes::T.new(start + self.songs.last.duration.to_f)
  end

  def to_s
    o = []
    %w{artist title ref}.each do |f|
      o << "#{f.upcase}: #{send(f)}" if send(f)
    end
    self.songs.each do |song|
      o << "#{song.idx+1}\t#{song.name}\t#{song.start.to_s}\t#{song.duration.to_s}"
    end
    o << "Duration: #{self.duration.to_s}"
    o.join("\n")
  end

end
