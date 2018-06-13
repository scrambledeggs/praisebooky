require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should validate_presence_of(:point) }
  it { should validate_numericality_of(:point) }
end
