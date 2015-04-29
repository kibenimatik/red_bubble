require 'fileutils'
require 'liquid'
module RedBubble
  class Output
    VENDOR_PREFIX = 'vendor_'
    CAMERA_PREFIX = 'camera_'
    class << self
      def output(options={})
        new(options).output!
      end
    end

    def initialize(options={})
      @options = options
    end

    def output!
      prepare_output_folder
      render_index_page
      render_vendor_pages
      render_camera_pages
    end


    private

    attr_reader :options

    def prepare_output_folder
      FileUtils.rm_rf options[:output_folder]
      FileUtils.mkdir_p options[:output_folder]
    end

    def render_index_page
      _options = {
        title: 'Index Page',
        images: RedBubble::Image.all.take(10),
        nav_static_links: {home: 'index.html'},
        nav_dynamic_items: RedBubble::Vendor.all,
        nav_dynamic_prefix: VENDOR_PREFIX
      }
      render_file('index.html', _options)
    end

    def render_vendor_pages
      RedBubble::Vendor.all.each do |vendor|
        _options = {
          title: vendor.name,
          images: vendor.images.take(10),
          nav_static_links: {home: 'index.html'},
          nav_dynamic_items: vendor.cameras,
          nav_dynamic_prefix: CAMERA_PREFIX
        }
        render_file("#{VENDOR_PREFIX}#{vendor.id}.html", _options)
      end
    end

    def render_camera_pages
      RedBubble::Camera.all.each do |camera|
        vendor = camera.vendor
        _options = {
          title: camera.name,
          images: camera.images,
          nav_static_links: {home: 'index.html', vendor.name => "#{VENDOR_PREFIX}#{vendor.id}.html"}
        }
        render_file("#{CAMERA_PREFIX}#{camera.id}.html", _options)
      end
    end

    def render_file(name, liquid_options={})
      template_file = File.read(File.join(RedBubble.layouts, "#{options[:layout]}/index.liquid"))
      output_file_name = File.join(options[:output_folder], name)
      output_file = File.open(output_file_name, 'w+')

      template = Liquid::Template.parse(template_file)
      output_file.write template.render(liquid_options.with_indifferent_access)
      output_file.close
    end
  end
end
