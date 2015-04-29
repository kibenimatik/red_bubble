require 'supermodel'
require "red_bubble/version"
require "red_bubble/parser"
require "red_bubble/factory"
require "red_bubble/output"

require 'red_bubble/models/base_model'
require 'red_bubble/models/vendor'
require 'red_bubble/models/camera'
require 'red_bubble/models/image'

module RedBubble
  class Generator
    class << self
      def run(options={})
        RedBubble::Parser.parse(options[:input])
        RedBubble::Output.output(layout: options[:layout], output_folder: options[:output])
      end
    end
  end
  def self.root
    File.expand_path '../..', __FILE__
  end

  def self.layouts
    File.join root, 'layouts'
  end
end
