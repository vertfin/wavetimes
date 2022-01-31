module Wavetimes

  class Cli
    require "optparse"

    def initialize
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: wavetimes [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end

        opts.on("-f", "--format [ref]", String, "Output format (text,html,json)") do |v|
          options[:format] = v
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

        opts.on("-s", "--splits [splits,]", String, "Specify side start indexes (can be multiple, comma separated") do |v|
          options[:splits] = v
        end

        opts.on("-n", "--splitnames [splitnames,]", String, "Specify side start indexes (can be multiple, comma separated") do |v|
          options[:splitnames] = v
        end

      end.parse!

      format = (options.delete(:format) || 'json').capitalize

      view_class_name = "Wavetimes::Views::#{format}"
      puts "VCN: #{view_class_name}"
      view_class = Object.const_get(view_class_name)

      album = Wavetimes::Album.new(options)
      view = view_class.new(album)
      puts view.render
    end
  end
end
