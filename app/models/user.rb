class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true

  belongs_to :department

  has_many :votes
  validates_associated :votes

  has_many :messages
  validates_associated :messages
end
