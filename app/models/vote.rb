class Vote < ApplicationRecord
  validates :point, presence: true, numericality: { only_integer: true, other_than: 0 }

  belongs_to :department
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
