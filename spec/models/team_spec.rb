# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Team, type: :model do
  it "has a valid factory" do
    expect(build(:team)).to be_valid
  end

  describe 'associations' do
    let(:team) { build(:team) }

    it { is_expected.to have_many(:competitors).dependent(:destroy) }
  end
end
