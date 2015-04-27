require 'nokogiri'
module RedBubble
  class Parser
    class << self
      def parse(input_file)
        input = new(input_file)
        input.parse!
      end
    end

    def initialize(input_file)
      @input_file = input_file
    end

    def parse!
      f = File.open(input_file)
      doc = Nokogiri::XML(f)

      doc.xpath('//works/work').each do |node|
        RedBubble::Factory.create(
          vendor: node.at_css('make').try(:text),
          camera: node.at_css('model').try(:text),
          images: node.css('url').map{|e| [e.attribute('type').value, e.text]}
        )
      end
      f.close
    end


    private

    attr_reader :input_file
  end
end
