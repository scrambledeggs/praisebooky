require 'rails_helper'

RSpec.describe MonthlyReward, type: :model do

  it { should validate_presence_of(:point) }
  it { should validate_numericality_of(:point).only_integer }
  
  it "should have an integer point where 0 is invalid" do
    monthly_reward = MonthlyReward.create(point: 0, description: "something")
    expect(monthly_reward).to be_invalid
  end

  it { should validate_presence_of(:description) }

  it { should belong_to(:department) }
  it { should have_many(:user) }

end
