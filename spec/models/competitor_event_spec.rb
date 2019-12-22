# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_events
#
#  id            :bigint           not null, primary key
#  medal         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competitor_id :bigint
#  event_id      :bigint
#
# Indexes
#
#  index_competitor_events_on_competitor_id  (competitor_id)
#  index_competitor_events_on_event_id       (event_id)
#

require 'rails_helper'

RSpec.describe CompetitorEvent, type: :model do
  it "has a valid factory" do
    expect(build(:competitor_event)).to be_valid
  end

  describe 'associations' do
    let(:competitor) { build(:competitor) }

    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:competitor) }
    it { is_expected.to define_enum_for(:medal) }
  end
end
