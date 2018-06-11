class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true
end
