module RedBubble
  class Vendor < RedBubble::BaseModel
    has_many :cameras, class_name: 'RedBubble::Camera', foreign_key: 'vendor_id'
    has_many :images, class_name: 'RedBubble::Image', foreign_key: 'vendor_id'
    attributes :name
  end
end
