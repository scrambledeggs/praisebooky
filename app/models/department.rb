class Department < ApplicationRecord
	validates :name, presence: true
  
  has_many :users
  validates_associated :users

  has_many :messages
  validates_associated :messages
end
