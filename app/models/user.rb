 class User < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true

  belongs_to :department

  has_many :votes_made, class_name: "Vote", foreign_key: "user_id"
  validates_associated :votes_made

  has_many :votes_received, class_name: "Vote", foreign_key: "receiver_id"
  validates_associated :votes_received

  has_many :messages
  validates_associated :messages

  has_many :monthly_reward
  validates_associated :monthly_reward
end
