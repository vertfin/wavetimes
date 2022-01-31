# frozen_string_literal: true

require "byebug"
require "json"
require "wavefile"

require_relative "wavetimes/version"
require_relative "wavetimes/t"
require_relative "wavetimes/song"
require_relative "wavetimes/album"
require_relative "wavetimes/views/text"
require_relative "wavetimes/views/html"
require_relative "wavetimes/views/json"

require_relative "wavetimes/cli"

module Wavetimes
  class Error < StandardError; end
  # Your code goes here...


end
