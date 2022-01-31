class Wavetimes::T

  attr_accessor :time, :hours, :minutes, :seconds, :ms, :frames
  # expects time in floating point seconds
  def initialize _t
    case _t.class.to_s
    when "String", "Float"
      self.time = _t.to_f
      t = _t.to_f
      self.hours = (t/3600).floor
      t -= hours*3600
      self.minutes = (t/60).floor
      t -= minutes*60
      self.seconds = t.floor
      t -= seconds
      self.ms = (t*1000).round(0)
      self.frames = ms_to_frames(t)
    when "WaveFile::Duration"
      self.hours = _t.hours
      self.minutes = _t.minutes
      self.seconds = _t.seconds
      self.ms = _t.milliseconds
      self.backfill_time!
    else
      raise StandardError, "Unknown class at T.new: #{_t.class.to_s}"
    end

  end

  def pretty_time_75fps
    "%02d:%02d:%02d:%02d" % [hours,minutes,seconds,frames]
  end

  def pretty_time_ms
    "%02d:%02d:%02d.%03d" % [hours,minutes,seconds,ms]
  end

  def to_s
    pretty_time_ms
  end

  def to_f
    time
  end

  private
  def ms_to_frames ms
    ((ms*1000)/(1000.0/75.0)).round(0)
  end

  def frames_to_ms frames
    (frames.to_f * (1000.0/75.0)).round.to_i
  end

  # yuckie! we've instantiated from a low resolution source, backport the
  # "authoritative" float.
  def backfill_time!
    self.time = (hours*3600)+(minutes*60)+(seconds)+(ms*0.001)
  end
end
