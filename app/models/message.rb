class Message < ApplicationRecord
	validates :content, presence: true

  belongs_to :department
end
