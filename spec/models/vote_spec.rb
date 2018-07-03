require 'rails_helper'

RSpec.describe Vote, type: :model do

  it { should validate_presence_of(:point) }

  it { should validate_numericality_of(:point).only_integer }
  
  it "should have an integer point where 0 is invalid" do
    vote = Vote.create(point: 0, comment: "something")
    expect(vote).to be_invalid
  end

  it "should be impossible to vote yourself" do
    vote = Vote.create(user_id: 1, receiver_id: 1, comment: "something")
    expect(vote).to be_invalid
  end

  it "should be impossible to vote with insufficient votes" do
    vote = Vote.create(point: 26, user_id: 1, receiver_id: 2, comment: "something")
    expect(vote).to be_valid
  end

  it { should belong_to(:department) }
  it { should belong_to(:voter) }
  it { should belong_to(:receiver) }

end
