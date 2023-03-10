class Comment < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :user, required: true
  validates :user, :project, presence: true
end
