class Department < ApplicationRecord
	validates :name, presence: true
  has_many :users
  has_many :messages
end
