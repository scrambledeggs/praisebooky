require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should belong_to(:department) }
  it { should have_many(:votes) }
  it { should have_many(:messages) }
end
