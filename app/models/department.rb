class Department < ApplicationRecord
  validates :name, presence: true

  has_many :users
  validates_associated :users

  has_many :messages
  validates_associated :messages

  has_many :monthly_rewards
  validates_associated :monthly_rewards

  has_many :votes
  validates_associated :votes
end
