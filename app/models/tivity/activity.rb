class Tivity::Activity < ApplicationRecord
  belongs_to :activiable, polymorphic: true
end
