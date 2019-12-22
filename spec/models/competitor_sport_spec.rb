# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_sports
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competitor_id :bigint
#  sport_id      :bigint
#
# Indexes
#
#  index_competitor_sports_on_competitor_id  (competitor_id)
#  index_competitor_sports_on_sport_id       (sport_id)
#

require 'rails_helper'

RSpec.describe CompetitorSport, type: :model do
  it "has a valid factory" do
    expect(build(:competitor_sport)).to be_valid
  end

  describe 'associations' do
    let(:competitor_sport) { build(:competitor_sport) }

    it { is_expected.to belong_to(:sport) }
    it { is_expected.to belong_to(:competitor) }
  end
end
