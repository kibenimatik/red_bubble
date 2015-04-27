module RedBubble
  class Image < RedBubble::BaseModel
    belongs_to :camera, class_name: 'RedBubble::Camera'
    belongs_to :vendor, class_name: 'RedBubble::Vendor'
    attributes :small_image_url, :medium_image_url, :large_image_url
  end
end
