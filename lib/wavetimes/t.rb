class Wavetimes::T

  # expects time in floating point seconds
  def initialize _t
    @t = _t.to_f
    t = _t.to_f
    @hours = (t/3600).floor
    t -= @hours*3600
    @minutes = (t/60).floor
    t -= @minutes*60
    @seconds = t.floor
    t -= @seconds
    @ms = (t*1000).round(0)
    @frames = ms_to_frames(t)
  end

  def pretty_time_75fps
    "%02d:%02d:%02d:%02d" % [@hours,@minutes,@seconds,@frames]
  end

  def pretty_time_ms
    "%02d:%02d:%02d.%03d" % [@hours,@minutes,@seconds,@ms]
  end

  def to_s
    pretty_time_ms
  end

  def to_f
    @t
  end

  private
  def ms_to_frames ms
    ((ms*1000)/(1000.0/75.0)).round(0)
  end

  def frames_to_ms frames
    (frames.to_f * (1000.0/75.0)).round.to_i
  end

end
