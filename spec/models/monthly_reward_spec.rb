require 'rails_helper'

RSpec.describe MonthlyReward, type: :model do
  # it "should have a point and must be other than 0" do
  #   monthly_reward = MonthlyReward.new(point: 0, description: "something")
  #   expect(monthly_reward.save).to eq(false)
  # end

  # it "should have description" do
  #   monthly_reward = MonthlyReward.new(point: 1, description: nil)
  #   expect(monthly_reward.valid?).to eq(false)
  # end

  it { should validate_presence_of(:point) }
  it { should validate_numericality_of(:point) }
  it { should validate_presence_of(:description) }

end
