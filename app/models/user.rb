class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true

  belongs_to :department
end
