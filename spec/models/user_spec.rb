require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have an email" do
    user = User.new(email: nil, first_name: "something", last_name: "something")
    expect(user.save).to eq(false)
  end

  it "should have a first name" do
    user = User.new(email: "something@example.com", first_name: nil, last_name: "something")
    expect(user.save).to eq(false)
  end

  it "should have a last name" do
    user = User.new(email: "something@example.com", first_name: "something", last_name: nil)
    expect(user.save).to eq(false)
  end
end
