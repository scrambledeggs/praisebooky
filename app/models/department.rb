class Department < ApplicationRecord
	validates :name, presence: true
  
  has_many :users
  validates_associated :users

end
