module RedBubble
  class Factory
    class << self
      def create(data={})
        new(data).create
      end
    end

    def initialize(data)
      @data = data
    end

    def create
      find_or_create_vendor
      find_or_create_camera
      create_image
    end

    private

    def find_or_create_vendor
      vendor_name = data[:vendor].presence || 'NONAME'
      @vendor = RedBubble::Vendor.find_or_create_by_name(vendor_name)
    end

    def find_or_create_camera
      camera_name = data[:camera].presence || 'NONAME'
      @camera = RedBubble::Camera.select do |c|
        c.vendor_id == vendor.id && c.name == camera_name
      end.first || RedBubble::Camera.create(name: camera_name, vendor: vendor)
    end

    def create_image
      images = Hash[data[:images]].with_indifferent_access
      RedBubble::Image.create(
        vendor: vendor,
        camera: camera,
        small_image_url:  images[:small],
        medium_image_url: images[:medium],
        large_image_url:  images[:large]
      )
    end

    attr_reader :data, :vendor, :camera
  end
end
