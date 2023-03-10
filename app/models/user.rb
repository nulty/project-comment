class User < ApplicationRecord
  has_secure_password

  validates :email, :usernamej, presence: true, uniqueness: true
end
