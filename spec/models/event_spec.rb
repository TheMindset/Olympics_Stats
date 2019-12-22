# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  describe 'associations' do
    let(:event) { build(:event) }

    it { is_expected.to have_many(:competitor_events) }
    it { is_expected.to have_many(:competitors).through(:competitor_events) }
  end
end
