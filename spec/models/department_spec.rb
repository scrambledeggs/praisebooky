require 'rails_helper'

RSpec.describe Department, type: :model do

  it { should validate_presence_of(:name) }

  it { should have_many(:users) }
  it { should have_many(:messages) }
  it { should have_many(:monthly_rewards) }
  it { should have_many(:votes) }

end

