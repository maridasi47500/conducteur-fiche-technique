class MetierDependency < ApplicationRecord
belongs_to :materiel
belongs_to :required_item, class_name: "Materiel", foreign_key: "required_item_id"
end
