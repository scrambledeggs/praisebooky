require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should validate_presence_of(:point) }
  
  it "should have a point and must be other than 0" do
    monthly_reward = MonthlyReward.new(point: 0, description: "something")
    expect(monthly_reward.save).to eq(false)
  end
  
  it { should validate_numericality_of(:point).only_integer }
end
