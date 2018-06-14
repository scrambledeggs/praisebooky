class MonthlyReward < ApplicationRecord
	validates :point, presence: true, numericality: { only_integer: true, other_than: 0 }
	validates :description, presence: true

  belongs_to :department
  belongs_to :user
end
