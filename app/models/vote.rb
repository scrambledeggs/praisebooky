class Vote < ApplicationRecord
	validates :point, presence: true, numericality: { only_integer: true, other_than: 0 }
  belongs_to :departments
end
