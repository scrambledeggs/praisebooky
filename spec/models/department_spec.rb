require 'rails_helper'

RSpec.describe Department, type: :model do

  it { should validate_presence_of(:name) }

  it { should have_many(:users) }

end

