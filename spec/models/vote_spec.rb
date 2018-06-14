require 'rails_helper'

RSpec.describe Vote, type: :model do

  it { should validate_presence_of(:point) }

  it { should validate_numericality_of(:point).only_integer }
  
  it "should have an integer point where 0 is invalid" do
    monthly_reward = MonthlyReward.create(point: 0, description: "something")
    expect(monthly_reward).to be_invalid
  end

  it "should have an integer point where it is less than 0" do
    monthly_reward = MonthlyReward.create(point: -1, description: "something")
    expect(monthly_reward).to be_valid
  end

  it "should have an integer point where it is greater than 0" do
    monthly_reward = MonthlyReward.create(point: 1, description: "something")
    expect(monthly_reward).to be_valid
  end
  
  

end
