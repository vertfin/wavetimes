module Wavetimes

  class Cli
    require "optparse"

    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: wavetimes [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end

      opts.on("-f", "--format [ref]", String, "Output format (text,html,json)") do |v|
        options[:ref] = v
      end

      opts.on("-a", "--artist [artist]", String, "Include artist name") do |v|
        options[:artist] = v
      end

      opts.on("-t", "--title [title]", String, "Include record title") do |v|
        options[:title] = v
      end

      opts.on("-r", "--ref [ref]", String, "Include reference code") do |v|
        options[:ref] = v
      end

      #opts.on("-s", "--sidesplits [idx]", String, "Specify side start indexes (can be multiple, comma separated") do |v|
      #  options[:sidesplits_at] = v
      #end

    end.parse!


    album = Wavetimes::Album.new(options).to_s

  end
end
