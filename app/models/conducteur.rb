class Conducteur < ApplicationRecord
has_many :conducteurlines
accepts_nested_attributes_for :conducteurlines, allow_destroy: true

end
