module RedBubble
  class Camera < RedBubble::BaseModel
    belongs_to :vendor, class_name: 'RedBubble::Vendor'
    has_many :images, class_name: 'RedBubble::Image', foreign_key: 'camera_id'

    attributes :name
  end
end
