require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "should have a point and must be other than 0" do
    vote = Vote.new(point:0, comment: nil)
    expect(vote.save).to eq(false)
  end
end
