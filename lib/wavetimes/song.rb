class Song

  ATTRS = [ :idx, :filename, :name, :start, :duration ]
  attr_accessor *ATTRS

  def initialize a
    self.idx = a[:idx].to_i
    self.filename = a[:filename]
    self.start = Wavetimes::T.new(a[:start])
    bn = File.basename(filename,".wav").split("-")
    bn.shift
    self.name = bn.join("-")
    get_duration
    self
  end

  def time
    # 00:06:09.56 (75 fps)
    hours, minutes, sex = self.orig_time.split(':')

    hours = hours.to_i
    minutes = minutes.to_i
    seconds, ms = sex.split('.')
    seconds = seconds.to_f
    ms = ms.to_f
    ms = ms  /75.0
    raise StandardError, "WTF?!" if ms>1.0

    t = (hours*60*60)+(minutes*60)+(seconds)+ms

    pt75 = pretty_time_75fps(t)
    if pt75!=orig_time
      raise StandardError, "Computed 75fps doesn't match orig: '#{pt75}' vs '#{orig_time}'"
    end

    t
  end

  def pretty_time_75fps t = time
    hours = (t/3600).floor
    t -= hours*3600
    minutes = (t/60).floor
    t -= minutes*60
    seconds = t.floor
    t -= seconds
    frames = ms_to_frames(t)
    "%02d:%02d:%02d.%02d" % [hours,minutes,seconds,frames]
  end

  def pretty_time_ms
    pt75, frames = pretty_time_75fps.split(".")
    ms = "%03d" % frames_to_ms(frames)
    pt75[0] + "." + frames
  end


  def get_duration
    d = WaveFile::Reader.new(filename).total_duration
    self.duration = Wavetimes::T.new(d)
    raise Error, "nil duration!" if self.duration.nil?
  end

  def serialized
    o = {}
    ATTRS.each do |k|
      o[k] = self.send(k)
    end
    o
  end

end
