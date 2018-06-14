class Message < ApplicationRecord
	validates :content, presence: true
  belongs_to :deparments
end
