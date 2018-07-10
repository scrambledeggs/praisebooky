class Vote < ApplicationRecord
  validates :point, presence: true, numericality: { only_integer: true, other_than: 0 }
  validate :voter_does_not_equal_receiver
  validate :voter_must_have_enough_votes

  belongs_to :department
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  private
  
  def voter_does_not_equal_receiver
    if self.voter == self.receiver
      @errors.add(:base, "You cannot vote yourself")
    end
  end

  def voter_must_have_enough_votes
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month
    
    total_votes = Vote.where(voter: self.voter).where(created_at: start_date..end_date).where("point > ?", 0).all.sum(:point) - Vote.where(voter: self.voter).where(created_at: start_date..end_date).where("point < ?", 0).all.sum(:point)

    if total_votes + point.to_i.abs > 25
      @errors.add(:base, "You have insufficient votes")
    end
  end
end
