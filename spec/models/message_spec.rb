require 'rails_helper'

RSpec.describe Message, type: :model do
   
   it "should have content" do
    	message = Message.new(content: nil)
    	expect(message.save).to eq(false)
    end
end
