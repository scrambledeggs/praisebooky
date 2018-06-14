class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true
  belongs_to :departments
  has_many :votes
  has_one :monthly_rewards
  has_many :messages
end
