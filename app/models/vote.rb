class Vote < ApplicationRecord
	validates :point, presence: true, numericality: { other_than: 0 }
end
