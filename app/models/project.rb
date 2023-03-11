class Project < ApplicationRecord
  include Tivity::Activise
  has_many :comments

  activities create: true
end
