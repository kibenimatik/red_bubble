module RedBubble
  class BaseModel < SuperModel::Base
    include SuperModel::RandomID

    def to_liquid
      attributes.with_indifferent_access
    end
  end
end
