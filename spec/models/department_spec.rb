require 'rails_helper'

RSpec.describe Department, type: :model do

    it "should have a name" do
    	department = Department.new(name: nil)
    	expect(department.save).to eq(false)
    end
end

