class MonthlyReward < ApplicationRecord
	validates :point, presence: true, numericality: { other_than: 0 }
	validates :description, presence: true
end
