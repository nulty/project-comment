class Tivity::Activity < ApplicationRecord
  belongs_to :activiable, polymorphic: true
  # belongs_to :activised, polymorphic: true
  belongs_to :user
end
