class Vote < ApplicationRecord
  validates :point, presence: true, numericality: { only_integer: true, other_than: 0 }
  validate :voter_does_not_equal_receiver

  belongs_to :department
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  private
  
  def voter_does_not_equal_receiver
    @errors.add(:vote, "You cannot vote yourself") if voter == receiver
  end
end
