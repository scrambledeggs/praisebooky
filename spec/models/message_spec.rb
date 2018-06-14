require 'rails_helper'

RSpec.describe Message, type: :model do

   it { should validate_presence_of(:content) }

   it { should belong_to(:department) }

end
 