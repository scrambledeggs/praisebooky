class Message < ApplicationRecord
	validates :content, presence: true

  belongs_to :department
  belongs_to :user
end
